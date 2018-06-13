package kh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static kh.common.JDBCTemplate.*;

import kh.member.model.vo.Member;
import kh.room.model.vo.Room;

public class BinDao {
	private Properties prop;
	
	public BinDao() {
		prop = new Properties();
		String fileName = MemberDao.class.getResource("/config/member/myPage-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<HashMap<String, Object>> myTripsListP(Connection con,String id) {
	      PreparedStatement pstmt = null;
	      ArrayList<HashMap<String,Object>> tCompleteList = null;
	      HashMap<String, Object> hmap = null;
	      ResultSet rset = null;
	      
	      
	      String query = prop.getProperty("myTripsListP");
	      
	      System.out.println("tCompleteList");
	      try{
	         pstmt = con.prepareStatement(query);	         
	         pstmt.setString(1, id);
	         
	         
	         rset = pstmt.executeQuery();
	            
	         tCompleteList = new ArrayList<HashMap<String,Object>>();
	         
	         while(rset.next()){
	            hmap = new HashMap<String, Object>();
	            
	            hmap.put("t_name", rset.getString("t_name"));
	            hmap.put("t_area", rset.getString("t_area"));
	            hmap.put("price", rset.getInt("price"));
	            hmap.put("t_date", rset.getString(String.valueOf("t_date")));        	            
	            tCompleteList.add(hmap);
	            
	         }
	         System.out.println("myTripsListP");
	      }catch(SQLException e){
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return tCompleteList;
	   }

	public ArrayList<HashMap<String, Object>> myTripsListW(Connection con, String id) {
		  PreparedStatement pstmt = null;
	      ArrayList<HashMap<String,Object>> tGoingtoList = null;
	      HashMap<String, Object> hmap = null;
	      ResultSet rset = null;
	      
	      
	      String query = prop.getProperty("myTripsListF");
	      
	      try{
	         pstmt = con.prepareStatement(query);	         
	         pstmt.setString(1, id);
 	         rset = pstmt.executeQuery();
	            
	         tGoingtoList = new ArrayList<HashMap<String,Object>>();
	         
	         while(rset.next()){
	            hmap = new HashMap<String, Object>();
	            
	            hmap.put("t_name", rset.getString("t_name"));
	            hmap.put("t_area", rset.getString("t_area"));
	            hmap.put("price", rset.getInt("price"));
	            hmap.put("t_date", rset.getString(String.valueOf("t_date")));        	            
	            tGoingtoList.add(hmap);
	            
	         }
	         System.out.println("myTripsListF");
	      }catch(SQLException e){
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return tGoingtoList;
	}

	public ArrayList<HashMap<String, Object>> myRoomsListP(Connection con, String id) {
		PreparedStatement pstmt = null;
	      ArrayList<HashMap<String,Object>> rCompleteList = null;
	      HashMap<String, Object> hmap = null;
	      ResultSet rset = null;
	      
	      
	      String query = prop.getProperty("myRoomsListP");
	      
	      try{
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setString(1, id);
	         
	         
	         rset = pstmt.executeQuery();
	            
	         rCompleteList = new ArrayList<HashMap<String,Object>>();
	         
	         while(rset.next()){
	            hmap = new HashMap<String, Object>();
	            
	            hmap.put("r_name", rset.getString("r_name"));
	            hmap.put("r_area", rset.getString("r_area"));
	            hmap.put("total_price", rset.getInt("total_price"));
	            hmap.put("check_in", rset.getString(String.valueOf("check_in")));        	 
	            hmap.put("check_out", rset.getString(String.valueOf("check_out")));        	            

	            rCompleteList.add(hmap);
	            
	         }
	         System.out.println("myRoomsListP");
	      }catch(SQLException e){
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return rCompleteList;
	}

	public ArrayList<HashMap<String, Object>> myRoomsListW(Connection con, String id) {
		 PreparedStatement pstmt = null;
	      ArrayList<HashMap<String,Object>> rGoingtoList = null;
	      HashMap<String, Object> hmap = null;
	      ResultSet rset = null;
	      
	      
	      String query = prop.getProperty("myRoomsListF");
	      
	      try{
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setString(1, id);
     
	         rset = pstmt.executeQuery();
	            
	         rGoingtoList = new ArrayList<HashMap<String,Object>>();
	         
	         while(rset.next()){
	        	  hmap = new HashMap<String, Object>();
		            
		            hmap.put("r_name", rset.getString("r_name"));
		            hmap.put("r_loc", rset.getString("r_loc"));
		            hmap.put("total_price", rset.getInt("total_price"));
		            hmap.put("check_in", rset.getString(String.valueOf("check_in")));        	 
		            hmap.put("check_out", rset.getString(String.valueOf("check_out")));        	            

		            rGoingtoList.add(hmap);
	            
	         }
	         System.out.println("myRoomsListF");
	      }catch(SQLException e){
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return rGoingtoList;
	}

	
	

}
