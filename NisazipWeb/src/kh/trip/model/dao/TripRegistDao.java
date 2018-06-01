package kh.trip.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Properties;

import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.TripRegist;

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

	public int insertThumbnailContent(Connection con, TripRegist tregist) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tregist.getTrip_name());
			pstmt.setString(2, tregist.getTrip_introduce());
			pstmt.setNull(3, Types.VARCHAR);

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
		int bno = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				bno = rset.getInt("currval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}

		return bno;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");
		System.out.println(fileList);

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBno());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());

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

	public int insertTrip(Connection con, TripRegist tregist) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTrip");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, tregist.getTrip_name());
			pstmt.setInt(2, tregist.getTrip_maxPeople());
			pstmt.setString(3, tregist.getTrip_category());
			pstmt.setString(4, tregist.getTrip_language());
			pstmt.setString(5, tregist.getTrip_startTime());
			pstmt.setString(6, tregist.getTrip_endTime());
			pstmt.setInt(7, tregist.getTrip_price());
			pstmt.setString(8, tregist.getTrip_introduce());
			pstmt.setString(9, tregist.getTrip_address());
			pstmt.setString(10, tregist.getTrip_stratReservation());
			pstmt.setString(11, tregist.getTrip_endReservation());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
		
	}

	public TripRegist selectOne(Connection con, String tno) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		TripRegist tregist = new TripRegist();
		
		String query = prop.getProperty("selectOne");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, tno);
			
			System.out.println("시퀀스 번호 뭐임 ? " + tno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				tregist.setTno(rset.getString("T_ID"));
				tregist.setTrip_name(rset.getString("T_NAME"));
				tregist.setUserId(rset.getString("HOST_ID"));
				tregist.setTrip_maxPeople(rset.getInt("T_MAX_NUM"));
				tregist.setTrip_category(rset.getString("T_TYPE"));
				tregist.setTrip_language(rset.getString("LANGUAGE"));
				tregist.setTrip_startTime(rset.getString("T_START_TIME"));
				tregist.setTrip_endTime(rset.getString("T_END_TIME"));
				tregist.setTrip_price(rset.getInt("PRICE"));
				tregist.setTrip_introduce(rset.getString("T_DETAIL"));
				tregist.setTrip_area(rset.getString("T_AREA"));
				tregist.setTrip_address(rset.getString("T_ADDR"));
				tregist.setTrip_stratReservation(rset.getString("T_START_DATE"));
				tregist.setTrip_endReservation(rset.getString("T_END_DATE"));
				tregist.setTrip_score(rset.getFloat("SCORE"));
				tregist.setTrip_enrolldate(rset.getString("T_DATE"));
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return tregist;
		
	}

	public int updateTrip(Connection con, TripRegist tregist) {

		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTrip");
		
		try {
			
			pstmt = con.prepareStatement(query);
			

			pstmt.setString(1, tregist.getTrip_name());
			pstmt.setInt(2, tregist.getTrip_maxPeople());
			pstmt.setString(3, tregist.getTrip_category());
			pstmt.setString(4, tregist.getTrip_language());
			pstmt.setString(5, tregist.getTrip_startTime());
			pstmt.setString(6, tregist.getTrip_endTime());
			pstmt.setInt(7, tregist.getTrip_price());
			pstmt.setString(8, tregist.getTrip_introduce());
			pstmt.setString(9, tregist.getTrip_area());
			pstmt.setString(10, tregist.getTrip_address());
			pstmt.setString(11, tregist.getTrip_stratReservation());
			pstmt.setString(12, tregist.getTrip_endReservation());
			pstmt.setString(13, tregist.getTno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		return result;
		
	}

	public TripRegist selectRecent(Connection con, String tno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		TripRegist tregist = new TripRegist();
		
		String query = prop.getProperty("selectRecent");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			System.out.println("시퀀스 번호 뭐임 ? " + tregist.getTno());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				tregist.setTno(rset.getString("T_ID"));
				tregist.setTrip_name(rset.getString("T_NAME"));
				tregist.setUserId(rset.getString("HOST_ID"));
				tregist.setTrip_maxPeople(rset.getInt("T_MAX_NUM"));
				tregist.setTrip_category(rset.getString("T_TYPE"));
				tregist.setTrip_language(rset.getString("LANGUAGE"));
				tregist.setTrip_startTime(rset.getString("T_START_TIME"));
				tregist.setTrip_endTime(rset.getString("T_END_TIME"));
				tregist.setTrip_price(rset.getInt("PRICE"));
				tregist.setTrip_introduce(rset.getString("T_DETAIL"));
				tregist.setTrip_area(rset.getString("T_AREA"));
				tregist.setTrip_address(rset.getString("T_ADDR"));
				tregist.setTrip_stratReservation(rset.getString("T_START_DATE"));
				tregist.setTrip_endReservation(rset.getString("T_END_DATE"));
				tregist.setTrip_score(rset.getFloat("SCORE"));
				tregist.setTrip_enrolldate(rset.getString("T_DATE"));
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
			
		}
		
		return tregist;
	}
	

}
