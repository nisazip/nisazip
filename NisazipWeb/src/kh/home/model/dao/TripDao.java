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

	public ArrayList<HashMap<String, Object>> selecttList(Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> tlist = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("toptList");
		
		System.out.println("tlist");
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

}
