package kh.review.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import kh.review.model.vo.Review;

public class ReviewDao {

	
	private Properties prop;
	
	public ReviewDao(){
		prop = new Properties();
		
		String fileName = ReviewDao.class.getResource("/config/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
	
		} catch (IOException e) {
		}
		
	}
	
	public int reviewInsert(Connection con, Review re) {
		int result=0;
		PreparedStatement pstmt =null;
		
		String query = prop.getProperty("reviewInsert");
		try {
			pstmt =con.prepareStatement(query);
			
			pstmt.setString(1, re.getHosting_id());
			pstmt.setString(2, re.getRe_content());
			pstmt.setString(3, re.getUser_id());
			pstmt.setFloat(4, re.getRe_score());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> reviewListScore(Connection con, String hosting_id) {
		ArrayList<HashMap<String, Object>> rlist =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Review re = null;
		HashMap<String,Object> hmap = null;
				
		String query = prop.getProperty("reviewListScore");
		
		try {
			pstmt= con.prepareStatement(query);
			
			pstmt.setString(1, hosting_id);
			
			rlist = new ArrayList<HashMap<String, Object>>();
			
			rs =pstmt.executeQuery();
			while(rs.next()){
				
				hmap = new HashMap<String, Object>();
				
				int review_no = rs.getInt("review_no");
				String re_content =rs.getString("re_content");
				String user_id =rs.getString("user_id");
				Date re_date = rs.getDate("re_date");
				float re_score = rs.getFloat("re_score");
				
				re = new Review(review_no, hosting_id, re_content, user_id, re_date, re_score);
				
				String userProfile= rs.getString("CHANGE_NAME");
				String user_name= rs.getString("user_name");
				
				hmap.put("review",re);
				hmap.put("userProfile", userProfile);
				hmap.put("user_name", user_name);
				
				
				rlist.add(hmap);
			}
			
		} catch (SQLException e) {
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return rlist;
	}

	public int checkInfoTrip(Connection con, String hosting_id, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("checkInfoTrip");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, hosting_id);
			pstmt.setString(2, user_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result =1;   
				//  1:이용고객임
				//  0: 이용안함.
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public int checkInfoRoom(Connection con, String hosting_id, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		String query = prop.getProperty("checkInfoRoom");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, hosting_id);
			pstmt.setString(2, user_id);
			
			rs = pstmt.executeQuery();
		
			if(rs.next()){
				result =1;   
				//  1:이용고객임
				//  0: 이용안함.
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		System.out.println("dao result ㄱ밧 : "+result );
		return result;
	}

	public int reviewDelete(Connection con, int review_no) {
		int result=0;
		PreparedStatement pstmt = null;
				
		String query = prop.getProperty("reviewDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, review_no);
			
			result= pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> reviewListTime(Connection con, String hosting_id) {
		ArrayList<HashMap<String, Object>> rlist =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Review re = null;
		HashMap<String,Object> hmap = null;
				
		String query = prop.getProperty("reviewListTime");
		
		try {
			pstmt= con.prepareStatement(query);
			
			pstmt.setString(1, hosting_id);
			
			rlist = new ArrayList<HashMap<String, Object>>();
			
			rs =pstmt.executeQuery();
			while(rs.next()){
				
				hmap = new HashMap<String, Object>();
				
				int review_no = rs.getInt("review_no");
				String re_content =rs.getString("re_content");
				String user_id =rs.getString("user_id");
				Date re_date = rs.getDate("re_date");
				float re_score = rs.getFloat("re_score");
				
				re = new Review(review_no, hosting_id, re_content, user_id, re_date, re_score);
				
				String userProfile= rs.getString("CHANGE_NAME");
				String user_name= rs.getString("user_name");
				
				hmap.put("review",re);
				hmap.put("userProfile", userProfile);
				hmap.put("user_name", user_name);
				
				
				rlist.add(hmap);
			}
			
		} catch (SQLException e) {
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return rlist;
	}

	public ArrayList<HashMap<String, Object>> reviewListScoreAsc(Connection con, String hosting_id) {
		ArrayList<HashMap<String, Object>> rlist =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Review re = null;
		HashMap<String,Object> hmap = null;
				
		String query = prop.getProperty("reviewListScoreAsc");
		
		try {
			pstmt= con.prepareStatement(query);
			
			pstmt.setString(1, hosting_id);
			
			rlist = new ArrayList<HashMap<String, Object>>();
			
			rs =pstmt.executeQuery();
			while(rs.next()){
				
				hmap = new HashMap<String, Object>();
				
				int review_no = rs.getInt("review_no");
				String re_content =rs.getString("re_content");
				String user_id =rs.getString("user_id");
				Date re_date = rs.getDate("re_date");
				float re_score = rs.getFloat("re_score");
				
				re = new Review(review_no, hosting_id, re_content, user_id, re_date, re_score);
				
				String userProfile= rs.getString("CHANGE_NAME");
				String user_name= rs.getString("user_name");
				
				hmap.put("review",re);
				hmap.put("userProfile", userProfile);
				hmap.put("user_name", user_name);
				
				rlist.add(hmap);
			}
			
		} catch (SQLException e) {
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return rlist;
	}

}
