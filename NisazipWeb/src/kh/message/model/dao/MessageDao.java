package kh.message.model.dao;

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

import kh.message.model.vo.Message;

public class MessageDao {
	private Properties prop;
	
	public MessageDao(){
		
		prop= new Properties();
		
		String fileName = MessageDao.class.getResource("/config/message/message-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int messageSend(Connection con, Message m) {
		
		int mResult = 0;
		PreparedStatement pstmt = null;
		String query= prop.getProperty("messageSend");
		
		try {
			pstmt =con.prepareStatement(query);

			pstmt.setString(1, m.getM_writer());
			pstmt.setString(2, m.getM_receiver());
			pstmt.setString(3, m.getHosting_id());
			pstmt.setString(4, m.getCheckin());
			pstmt.setString(5, m.getCheckout());
			pstmt.setInt(6, m.getGuest_num());
			pstmt.setString(7, m.getM_content());
			
			mResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return mResult;
	}

	public ArrayList<Message> messageList(Connection con, String user_id) {
		ArrayList<Message> mlist= null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String query = prop.getProperty("messageList3");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			
			rs=pstmt.executeQuery();
			mlist =new ArrayList<>();

			while(rs.next()){
				Message m = new Message();
				
				int m_no = rs.getInt("M_NO");
				String m_writer= rs.getString("M_WRITER");
				String m_receiver= rs.getString("M_RECEIVER");
				String hosting_id= rs.getString("HOSTING_ID");
				String checkin= rs.getString("CHECKIN");
				String checkout= rs.getString("CHECKOUT");
				int guest_num = rs.getInt("GUEST_NUM");
				String m_content= rs.getString("M_CONTENT");
				String m_date_time =rs.getString("m_date_time");
				
				m = new Message(m_no, m_writer, m_receiver, hosting_id, checkin, checkout, guest_num, m_content,m_date_time);
				
				mlist.add(m);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
		return mlist;
	}

	public Message messageSelect(Connection con, int m_no) {
		Message m = null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		
		String query = prop.getProperty("messageSelect");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);
			
			rs=pstmt.executeQuery();
			if(rs.next()){
				m = new Message();
				
				String m_writer= rs.getString("M_WRITER");
				String m_receiver= rs.getString("M_RECEIVER");
				String hosting_id= rs.getString("HOSTING_ID");
				String checkin= rs.getString("CHECKIN");
				String checkout= rs.getString("CHECKOUT");
				int guest_num = rs.getInt("GUEST_NUM");
				String m_content= rs.getString("M_CONTENT");
				
				// 8개 정보 다줌
				m = new Message(m_no, m_writer, m_receiver, hosting_id, checkin, checkout, guest_num, m_content);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
			
		}
		
		
		
		return m;
	}

	public ArrayList<HashMap<String, Object>> writeMList(Connection con, String user_id) {
		ArrayList<HashMap<String, Object>> mlist = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("writeMList2");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);

			rs=pstmt.executeQuery();
			mlist = new ArrayList<HashMap<String,Object>>();
			
			
			while(rs.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("m_no",rs.getInt("M_NO"));
				hmap.put("m_writer", rs.getString("m_writer"));
				hmap.put("m_receiver", rs.getString("m_receiver"));
				hmap.put("hosting_id", rs.getString("hosting_id"));
				hmap.put("m_content", rs.getString("m_content"));
				hmap.put("m_date_time", rs.getString("m_date_time"));
				hmap.put("senderName", rs.getString("user_name"));
				hmap.put("senderProfile",rs.getString("change_name"));
				hmap.put("hostingName",rs.getString("HOSTING_NAME"));
				if(rs.getInt("M_READ")==0){
					hmap.put("mRead","읽지않음");
				}else{
					hmap.put("mRead","");
				}
				
				//hmap.put("mRead",rs.getInt("M_READ"));
				
				mlist.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
		}
		
		return mlist;
	}

	public ArrayList<HashMap<String, Object>> receiveMList(Connection con, String user_id) {
		ArrayList<HashMap<String, Object>> rlist = null;
		HashMap<String,Object> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("receiveMList2");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);

			rs=pstmt.executeQuery();
			rlist = new ArrayList<HashMap<String,Object>>();
			
			
			while(rs.next()){
				hmap = new HashMap<String, Object>();
				
				hmap.put("m_no",rs.getInt("M_NO"));
				hmap.put("m_writer", rs.getString("m_writer"));
				hmap.put("m_receiver", rs.getString("m_receiver"));
				hmap.put("hosting_id", rs.getString("hosting_id"));
				hmap.put("m_content", rs.getString("m_content"));
				hmap.put("m_date_time", rs.getString("m_date_time"));
				hmap.put("senderName", rs.getString("user_name"));
				hmap.put("senderProfile",rs.getString("change_name"));
				hmap.put("hostingName",rs.getString("HOSTING_NAME"));
				
				if(rs.getInt("M_READ")==0){
					hmap.put("mRead","읽지않음");
				}else{
					hmap.put("mRead","");
				}
				
			

				rlist.add(hmap);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return rlist;
	}

	public HashMap<String,String> findProfile(Connection con, String user_id) {
		HashMap<String,String> hmap = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("findProfile");
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, user_id);

			rs=pstmt.executeQuery();
			if(rs.next()){
				hmap =new HashMap<>();
				hmap.put("userName", rs.getString("USER_NAME"));
				hmap.put("profile", rs.getString("CHANGE_NAME"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		return hmap;
	}

	public HashMap<String, String> hostInfoRoom(Connection con, String hosting_id, int m_no) {
			HashMap<String,String> hmap= null;
			ResultSet rs = null;
			PreparedStatement pstmt = null;
			
			String query = prop.getProperty("hostInfoRoom");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, m_no);
				
				rs= pstmt.executeQuery();
				if(rs.next()){
					hmap =new HashMap<String,String>();
					
					hmap.put("price", rs.getString("price"));
					hmap.put("hostingName", rs.getString("r_name"));
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(rs);
				close(pstmt);
			}
			
			
		return hmap;
	}

	public HashMap<String, String> hostInfoTrip(Connection con, String hosting_id, int m_no) {
		HashMap<String,String> hmap= null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("hostInfoTrip");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);
			
			rs= pstmt.executeQuery();
			if(rs.next()){
				hmap =new HashMap<String,String>();
				
				hmap.put("price", rs.getString("price"));
				hmap.put("hostingName", rs.getString("t_name"));
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		
	return hmap;
	}

	public int readCheck(Connection con, int m_no) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("readCheck");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int unReadChk(Connection con, int m_no) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("unReadChk");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, m_no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
