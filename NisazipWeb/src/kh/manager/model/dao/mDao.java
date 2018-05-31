package kh.manager.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import kh.member.model.vo.Member;
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
	
	public ArrayList<Member> mList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> result = new ArrayList<Member>();
		Member m = null;
		
		String query = prop.getProperty("selectAllList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				m = new Member();
				m.setUser_no(rset.getInt("USER_NO"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setUser_name(rset.getString("USER_NAME"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setGender(rset.getString("GENDER").charAt(0));
				m.setBirthdate(rset.getString("BIRTH"));
				m.setR_hosting(rset.getInt("R_HOSTING"));
				m.setT_hosting(rset.getInt("T_HOSTING"));
				m.setJoin_date(rset.getDate("JOIN_DATE"));

				result.add(m);
				
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
				t.setT_start_time(rset.getDate("T_START_TIME"));
				t.setT_end_time(rset.getDate("T_END_TIME"));
				t.setPrice(rset.getInt("PRICE"));
				t.setT_detail(rset.getString("T_DETAIL"));
				t.setT_area(rset.getString("T_AREA"));
				t.setT_addr(rset.getString("T_ADDR"));
				t.setT_loc(rset.getString("T_LOC"));
				t.setT_start_date(rset.getDate("T_START_DATE"));
				t.setT_end_date(rset.getDate("T_END_DATE"));
				t.setScore(rset.getFloat("SCORE"));
				t.setT_date(rset.getDate("T_DATE"));
				System.out.println("dao"+t);
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

}
