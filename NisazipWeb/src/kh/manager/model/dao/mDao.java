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
import kh.report.model.vo.Report;
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

	public ArrayList<Room> rList(Connection con,int currentPage, int limit) {
		
		ArrayList<Room> list = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Room r = null;
		
		String query = prop.getProperty("selectAllRoom");
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Room>();
			
			while(rset.next()) {
				r = new Room();
				r.setR_id(rset.getString("R_ID"));
				r.setR_name(rset.getString("R_NAME"));
				r.setHost_id(rset.getString("HOST_ID"));
				r.setR_max_num(rset.getInt("R_MAX_NUM"));
				r.setR_type(rset.getString("R_TYPE"));
				r.setR_type2(rset.getString("R_TYPE2"));
				r.setPrice(rset.getInt("PRICE"));
				r.setR_area(rset.getString("R_AREA"));
				/*r.setR_addr(rset.getString("R_ADDR"));
				r.setR_loc(rset.getString("R_LOC"));
				r.setR_start_date(rset.getString("R_START_DATE"));
				r.setR_end_date(rset.getString("R_END_DATE"));*/
				/*r.setR_option(rset.getString("R_OPTION"));
				r.setRoom_num(rset.getInt("ROOM_NUM"));
				r.setToilet_num(rset.getInt("TOILET_NUM"));
				r.setBed_num(rset.getInt("BED_NUM"));
				r.setR_detail(rset.getString("R_DETAIL"));
				r.setR_role(rset.getString("R_ROLE"));*/
				r.setScore(rset.getFloat("SCORE"));
				r.setR_date(rset.getString("R_DATE"));
				System.out.println("dao"+r);
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;

	}

	public ArrayList<Trip> tList(Connection con, int currentPage, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Trip> list = new ArrayList<Trip>();
		Trip t = null;
		
		String query = prop.getProperty("selectAllTrip");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Trip>();
			
			while(rset.next()) {
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
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
		
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
		
/*		String[] a = m.getBirthdate().split(", ");
		String[] b = m.getBirthdate().split(",");
		*/
		
		if(m.getBirthdate().equals("")){
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
			
			if(m.getBirthdate().equals("")){
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

	public HashMap<String, Object> selectTrip(Connection con, String tno) {
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
				
				System.out.println("selectOneTrip : "+t);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return t;
	}

	public int updateTrip(Connection con, Trip t) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
			query = prop.getProperty("updateTrip");
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

	public int deleteTrip(Connection con, String tno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteTrip");

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

	public HashMap<String, Object> selectRoom(Connection con, String rNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> r = null;
		
		String query = prop.getProperty("selectOneRoom");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rNo);
			pstmt.setString(2, rNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				r = new HashMap<String, Object>();
				
				r.put("R_ID", rset.getString("R_ID"));
				r.put("R_NAME",rset.getString("R_NAME"));
				r.put("HOST_ID",rset.getString("HOST_ID"));
				r.put("R_MAX_NUM",rset.getString("R_MAX_NUM"));
				r.put("R_TYPE",rset.getString("R_TYPE"));
				r.put("R_TYPE2",rset.getString("R_TYPE2"));
				r.put("R_OPTION",rset.getString("R_OPTION"));
				r.put("ROOM_NUM",rset.getInt("ROOM_NUM"));
				r.put("TOILET_NUM",rset.getInt("TOILET_NUM"));
				r.put("BED_NUM",rset.getInt("BED_NUM"));
				r.put("R_DETAIL", rset.getString("R_DETAIL"));
				r.put("R_ROLE", rset.getString("R_ROLE"));
				r.put("PRICE",rset.getInt("PRICE"));
				r.put("R_AREA",rset.getString("R_AREA"));
				r.put("R_ADDR",rset.getString("R_ADDR"));
				r.put("R_START_DATE",rset.getString("R_START_DATE"));
				r.put("R_END_DATE",rset.getString("R_END_DATE"));
				r.put("SCORE",rset.getFloat("SCORE"));
				r.put("R_DATE",rset.getString("R_DATE"));
				r.put("RCNT",rset.getInt("RCNT"));
				
				System.out.println("selectOneRoom : "+r);
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
				
		return r;
	}

	public int updateRoom(Connection con, Room r) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "";
		
			query = prop.getProperty("updateRoom");
		try {
			
			/* R_AREA=?, R_ADDR=?, R_START_DATE=TO_DATE(?,'YYYY-MM-DD'), R_END_DATE=TO_DATE(?,'YYYY-MM-DD') WHERE R_ID = ?*/
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getR_name());
			pstmt.setInt(2, r.getR_max_num());
			pstmt.setString(3, r.getR_type());
			pstmt.setString(4, r.getR_type2());
			pstmt.setString(5, r.getR_option());
			
			pstmt.setInt(6, r.getRoom_num());
			pstmt.setInt(7, r.getToilet_num());
			pstmt.setInt(8, r.getBed_num());
			
			pstmt.setString(9, r.getR_detail());
			pstmt.setString(10, r.getR_role());
			pstmt.setInt(11, r.getPrice());
			pstmt.setString(12, r.getR_area());
			pstmt.setString(13, r.getR_addr());
			pstmt.setString(14, r.getR_start_date());
			pstmt.setString(15, r.getR_end_date());
			pstmt.setString(16, r.getR_id());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int deleteRoom(Connection con, String rno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRoom");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, rno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		return result;
	}

	public int getMemeberListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listMemberCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public ArrayList<MemberList> selectMemberList(Connection con, int currentPage, int limit) {
		ArrayList<MemberList> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberList m = null;
		
		String query = prop.getProperty("selectMemberList");
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MemberList>();
			
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
				list.add(m);
				System.out.println("DAO : "+m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int getRoomListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listRoomCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int getTripListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listTripCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchIdMemeberListCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchIdMemeberListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchNameMemeberListCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchNameMemeberListCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public ArrayList<MemberList> searchId(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberList> list = null;
		MemberList m =null;
		
		String query = prop.getProperty("searchIdMemeberList");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<MemberList>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
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
				list.add(m);
				System.out.println("DAO : "+m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public ArrayList<MemberList> searchName(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MemberList> list = null;
		MemberList m =null;
		
		String query = prop.getProperty("searchNameMemeberList");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<MemberList>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
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
				list.add(m);
				System.out.println("DAO : "+m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public int searchRNameCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchRNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchRHostIdCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchRHostIdCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchRAreaCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchRAreaCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public ArrayList<Room> searchRName(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Room> list = null;
		Room r =null;
		
		String query = prop.getProperty("searchRName");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Room>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Room();
				r.setR_id(rset.getString("R_ID"));
				r.setR_name(rset.getString("R_NAME"));
				r.setHost_id(rset.getString("HOST_ID"));
				r.setR_max_num(rset.getInt("R_MAX_NUM"));
				r.setR_type(rset.getString("R_TYPE"));
				r.setR_type2(rset.getString("R_TYPE2"));
				r.setPrice(rset.getInt("PRICE"));
				r.setR_area(rset.getString("R_AREA"));
				r.setScore(rset.getFloat("SCORE"));
				r.setR_date(rset.getString("R_DATE"));
				System.out.println("dao"+r);
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public ArrayList<Room> searchRHostId(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Room> list = null;
		Room r =null;
		
		String query = prop.getProperty("searchRHostId");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Room>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Room();
				r.setR_id(rset.getString("R_ID"));
				r.setR_name(rset.getString("R_NAME"));
				r.setHost_id(rset.getString("HOST_ID"));
				r.setR_max_num(rset.getInt("R_MAX_NUM"));
				r.setR_type(rset.getString("R_TYPE"));
				r.setR_type2(rset.getString("R_TYPE2"));
				r.setPrice(rset.getInt("PRICE"));
				r.setR_area(rset.getString("R_AREA"));
				r.setScore(rset.getFloat("SCORE"));
				r.setR_date(rset.getString("R_DATE"));
				System.out.println("dao"+r);
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public ArrayList<Room> searchRArea(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Room> list = null;
		Room r =null;
		
		String query = prop.getProperty("searchRArea");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Room>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				r = new Room();
				r.setR_id(rset.getString("R_ID"));
				r.setR_name(rset.getString("R_NAME"));
				r.setHost_id(rset.getString("HOST_ID"));
				r.setR_max_num(rset.getInt("R_MAX_NUM"));
				r.setR_type(rset.getString("R_TYPE"));
				r.setR_type2(rset.getString("R_TYPE2"));
				r.setPrice(rset.getInt("PRICE"));
				r.setR_area(rset.getString("R_AREA"));
				r.setScore(rset.getFloat("SCORE"));
				r.setR_date(rset.getString("R_DATE"));
				System.out.println("dao"+r);
				list.add(r);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public int searchTNameCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchTNameCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchTHostIdCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchTHostIdCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchTAreaCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchTAreaCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public ArrayList<Trip> searchTName(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trip> list = null;
		Trip t =null;
		
		String query = prop.getProperty("searchTName");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Trip>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
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
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public ArrayList<Trip> searchTHostId(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trip> list = null;
		Trip t =null;
		
		String query = prop.getProperty("searchTHostId");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Trip>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
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
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public ArrayList<Trip> searchTArea(Connection con, int currentPage, int limit, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Trip> list = null;
		Trip t =null;
		
		String query = prop.getProperty("searchTArea");

		//조회할 숫자 startRow와 endRow 계산
		int startRow = (currentPage - 1) * limit+1;
		int endRow = startRow + (limit-1);
		
		list = new ArrayList<Trip>();

		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
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
				list.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return list;
	}

	public int getReportListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getReportListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchReWriterCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchReWriterCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public int searchReReciverCount(Connection con, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("searchReReciverCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
			
		return result;
	}

	public ArrayList<Report> reList(Connection con, int currentPage, int limit) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Report> list = new ArrayList<Report>();
		Report re = null;
		
		String query = prop.getProperty("getReportList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Report>();
			
			while(rset.next()) {
				re = new Report();
				re.setRp_no(rset.getInt("RP_NO"));
				re.setRp_writer(rset.getString("RP_WRITER"));
				re.setRp_receiver(rset.getString("RP_RECEIVER"));
				re.setRp_type(rset.getString("RP_TYPE"));
				re.setRp_date(rset.getString("RP_DATE"));
				System.out.println(re);				
				list.add(re);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
		
	}

	public ArrayList<Report> searchReWriter(Connection con, int currentPage, int limit, String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Report> list = new ArrayList<Report>();
		Report re = null;
		
		String query = prop.getProperty("searchReWriter");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Report>();
			
			while(rset.next()) {
				re = new Report();
				re.setRp_no(rset.getInt("RP_NO"));
				re.setRp_writer(rset.getString("RP_WRITER"));
				re.setRp_receiver(rset.getString("RP_RECEIVER"));
				re.setRp_type(rset.getString("RP_TYPE"));
				re.setRp_date(rset.getString("RP_DATE"));
				System.out.println(re);				
				list.add(re);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Report> searchReReciver(Connection con, int currentPage, int limit, String keyword) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Report> list = new ArrayList<Report>();
		Report re = null;
		
		String query = prop.getProperty("searchReReciver");
		
		try {
			pstmt = con.prepareStatement(query);
			
			//조회할 숫자 startRow와 endRow 계산
			int startRow = (currentPage - 1) * limit+1;
			int endRow = startRow + (limit-1);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Report>();
			
			while(rset.next()) {
				re = new Report();
				re.setRp_no(rset.getInt("RP_NO"));
				re.setRp_writer(rset.getString("RP_WRITER"));
				re.setRp_receiver(rset.getString("RP_RECEIVER"));
				re.setRp_type(rset.getString("RP_TYPE"));
				re.setRp_date(rset.getString("RP_DATE"));
				System.out.println(re);				
				list.add(re);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}





}
