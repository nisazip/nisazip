package kh.message.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import kh.message.model.vo.MessageContent;

public class MessageContentDao {

	
	private Properties prop;
	
	public MessageContentDao(){
		prop = new Properties();
		
		String fileName = MessageContentDao.class.getResource("/config/message/messageContent-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int msInsert(Connection con, MessageContent ms) {
		int result =0;
		PreparedStatement pstmt =null;
		
		String query =prop.getProperty("msInsert");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, ms.getM_no());
			pstmt.setString(2, ms.getMs_writer());
			pstmt.setString(3, ms.getMs_receiver());
			pstmt.setString(4, ms.getMs_content());
			
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}



	public ArrayList<MessageContent> msList(Connection con, int m_no) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		ArrayList<MessageContent> mclist=null;
		MessageContent mc = null;
		
		String query =prop.getProperty("msList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, m_no);
			
			rs = pstmt.executeQuery();
			
			mclist =new ArrayList<MessageContent>();
			while(rs.next()){
				mc = new MessageContent();
				
				int ms_no = rs.getInt("ms_no");
				String ms_writer = rs.getString("ms_writer");
				String ms_receiver= rs.getString("ms_receiver");
				String ms_content = rs.getString("ms_content");
				String ms_date_time = rs.getString("ms_date_time");

				mc.setM_no(m_no);
				mc.setMs_no(ms_no);
				mc.setMs_writer(ms_writer);
				mc.setMs_receiver(ms_receiver);
				mc.setMs_content(ms_content);
				mc.setMs_date_time(ms_date_time);
				
				mclist.add(mc);
				
			}
			 		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return mclist;
	}

}
