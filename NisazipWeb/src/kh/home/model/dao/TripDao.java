package kh.home.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import kh.trip.model.vo.Trip;

public class TripDao {
	private Properties prop;
	
	public TripDao(){
		prop = new Properties();
		
		String fileName = TripDao.class.getResource("/config/home/home-query.properties").getPath();
	
		try{
			prop.load(new FileReader(fileName));
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> select4tripList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> tlist = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("toptList");
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 4);
			
			rset = pstmt.executeQuery();
			
			tlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("t_id", rset.getString("t_id"));
				hmap.put("t_name", rset.getString("t_name"));
				hmap.put("host_id", rset.getString("host_id"));
				hmap.put("price", rset.getString("price"));
				hmap.put("t_loc", rset.getString("t_loc"));
				hmap.put("score", rset.getString("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				tlist.add(hmap);
				
			}
			System.out.println("tlist");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return tlist;
	}
	
	public ArrayList<HashMap<String, Object>> selectAlltripList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> tlist = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("toptList");
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, 100);
			
			rset = pstmt.executeQuery();
			
			tlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("t_id", rset.getString("t_id"));
				hmap.put("t_name", rset.getString("t_name"));
				hmap.put("host_id", rset.getString("host_id"));
				hmap.put("price", rset.getString("price"));
				hmap.put("t_loc", rset.getString("t_loc"));
				hmap.put("t_addr", rset.getString("t_addr"));
				hmap.put("score", rset.getString("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				tlist.add(hmap);
				
			}
			System.out.println("tlist");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return tlist;
	}

	public ArrayList<HashMap<String, Object>> searchKeyword(Connection con,String keyword) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> tlist = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("searchtKeyword");
		
		System.out.println("tlist");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			pstmt.setInt(4, 100);
			
			rset = pstmt.executeQuery();
			
			tlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("t_id", rset.getString("t_id"));
				hmap.put("t_name", rset.getString("t_name"));
				hmap.put("host_id", rset.getString("host_id"));
				hmap.put("price", rset.getString("price"));
				hmap.put("t_loc", rset.getString("t_loc"));
				hmap.put("t_addr", rset.getString("t_addr"));
				hmap.put("score", rset.getString("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				tlist.add(hmap);
				
			}
			System.out.println("tlist");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return tlist;
	}
	
	
	public ArrayList<HashMap<String, Object>> sortKeyword(Connection con,String keyword) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> tlist = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("sorttKeyword");
		
		System.out.println("tlist");
		try{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setString(2, keyword);
			pstmt.setString(3, keyword);
			
			rset = pstmt.executeQuery();
			
			tlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("t_id", rset.getString("t_id"));
				hmap.put("t_name", rset.getString("t_name"));
				hmap.put("host_id", rset.getString("host_id"));
				hmap.put("price", rset.getString("price"));
				hmap.put("t_loc", rset.getString("t_loc"));
				hmap.put("t_addr", rset.getString("t_addr"));
				hmap.put("score", rset.getString("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				tlist.add(hmap);
				
			}
			System.out.println("tlist");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return tlist;
	}
	
	public ArrayList<HashMap<String, Object>> homeTripSearch(Connection con,String location,String checkin,
			String checkout,int people) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> tlist = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		String query = prop.getProperty("homeTsearch");
		
		try{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, location);
			pstmt.setString(2, checkin);
			pstmt.setString(3, checkout);
			pstmt.setInt(4, people);
			
			rset = pstmt.executeQuery();
				
			tlist = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("t_id", rset.getString("t_id"));
				hmap.put("t_name", rset.getString("t_name"));
				hmap.put("host_id", rset.getString("host_id"));
				hmap.put("price", rset.getString("price"));
				hmap.put("t_start_date", rset.getString("t_start_date"));
				hmap.put("t_end_date", rset.getString("t_end_date"));
				hmap.put("t_max_num", rset.getInt("t_max_num"));
				hmap.put("t_loc", rset.getString("t_loc"));
				hmap.put("t_addr", rset.getString("t_addr"));
				hmap.put("score", rset.getString("score"));
				hmap.put("file_path", rset.getString("file_path"));
				hmap.put("change_name", rset.getString("change_name"));
				
				tlist.add(hmap);
				
			}
			System.out.println("tlist");
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return tlist;
	}

}
