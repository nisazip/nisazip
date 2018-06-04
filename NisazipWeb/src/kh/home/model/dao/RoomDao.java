package kh.home.model.dao;

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

import kh.home.model.vo.RecRoom;
import kh.home.model.vo.Room;

public class RoomDao {
	private Properties prop;
	
	public RoomDao(){
		prop = new Properties();
		
		String fileName = RoomDao.class.getResource("/config/home/home-query.properties").getPath();
	
		try{
			prop.load(new FileReader(fileName));
			
		}catch(IOException e){
			e.printStackTrace();
		}
	
	}

	public ArrayList<HashMap<String, Object>> select4roomList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> rlist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("toprList");
		
		System.out.println("rlist");
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 4);
			
			rset = pstmt.executeQuery();
				
			rlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("r_id", rset.getString("r_id"));
				hmap.put("r_name", rset.getString("r_name"));
				hmap.put("price", rset.getInt("price"));
				hmap.put("r_loc", rset.getString("r_loc"));
				hmap.put("score", rset.getFloat("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				
				rlist.add(hmap);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}


	public ArrayList<HashMap<String, Object>> select8roomList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> rlist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("toprList");
		
		System.out.println("rlist");
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 8);
			
			rset = pstmt.executeQuery();
				
			rlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("r_id", rset.getString("r_id"));
				hmap.put("r_name", rset.getString("r_name"));
				hmap.put("price", rset.getInt("price"));
				hmap.put("r_loc", rset.getString("r_loc"));
				hmap.put("score", rset.getFloat("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				
				rlist.add(hmap);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	public ArrayList<RecRoom> recRoom(Connection con){
		Statement stmt = null;
		ResultSet rset=null;
		ArrayList<RecRoom> reclist = null;
		
		String query = prop.getProperty("cntRoom");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
		
			reclist = new ArrayList<RecRoom>();
			
			while(rset.next()){
				RecRoom rec = new RecRoom();
				
				rec.setCntRoom(rset.getInt(1));
				rec.setArea(rset.getString(2));
				
				reclist.add(rec);
			}
		} catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return reclist;
	}

	public ArrayList<HashMap<String, Object>> searchKeyword(Connection con,String keyword) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> rlist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("searchrKeyword");
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
				
			rlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("r_id", rset.getString("r_id"));
				hmap.put("r_name", rset.getString("r_name"));
				hmap.put("price", rset.getInt("price"));
				hmap.put("r_loc", rset.getString("r_loc"));
				hmap.put("score", rset.getFloat("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				
				rlist.add(hmap);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	
	public ArrayList<HashMap<String, Object>> homeRoomSearch(Connection con,String location,String checkin,
			String checkout,String adults) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> rlist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("homeRsearch");
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, location);
			pstmt.setString(2, checkin);
			pstmt.setString(3, checkout);
			pstmt.setString(4, adults);
			
			rset = pstmt.executeQuery();
				
			rlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("r_id", rset.getString("r_id"));
				hmap.put("r_name", rset.getString("r_name"));
				hmap.put("price", rset.getInt("price"));
				hmap.put("r_loc", rset.getString("r_loc"));
				hmap.put("score", rset.getFloat("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				
				rlist.add(hmap);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return rlist;
	}
	


}
