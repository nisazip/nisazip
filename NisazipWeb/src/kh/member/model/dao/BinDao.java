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
		String fileName = MemberDao.class.getResource("/config/member/myPage-query").getPath();
		
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
	         System.out.println("rlist");
	      }catch(SQLException e){
	         e.printStackTrace();
	      }finally{
	         close(rset);
	         close(pstmt);
	      }
	      
	      return tCompleteList;
	   }

	
	

}
