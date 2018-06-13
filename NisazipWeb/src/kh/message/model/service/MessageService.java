package kh.message.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.message.model.dao.MessageDao;
import kh.message.model.vo.Message;
public class MessageService {

	public int messageSend(Message message) {
		Connection con = getConnection();
		int mResult = 0;
		mResult = new MessageDao().messageSend(con, message);

		if(mResult>0) commit(con);
		else rollback(con);
		
		close(con);
			
		return mResult;
	}

	public ArrayList<Message> messageList(String user_id) {
		Connection con = getConnection();
		ArrayList<Message> mlist = null;
		
		mlist = new MessageDao().messageList(con, user_id);
		close(con);
		
		return mlist;
	}

	public Message messageSelect(int m_no) {
		Connection con = getConnection();
		Message message = null;
		
		message = new MessageDao().messageSelect(con,m_no);
		
		
		close(con);
		
		return message;
	}

	public ArrayList<HashMap<String, Object>> writeMList(String user_id) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> mlist =null;
		
		mlist= new MessageDao().writeMList(con,user_id);
		
		
		close(con);
		
		return mlist;

	
	}

	public ArrayList<HashMap<String, Object>> receiveMList(String user_id) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> mlist =null;
		
		mlist= new MessageDao().receiveMList(con,user_id);
		
		
		close(con);
		
		return mlist;
	}

	public HashMap<String, String> findProfile(String user_id){
		Connection con = getConnection();
		HashMap<String, String> hmap=null;
		
		hmap= new MessageDao().findProfile(con,user_id);
		
		
		close(con);
		
		return hmap;
		
	}



	public HashMap<String, String> hostInfo(int m_no, String hosting_id) {
		Connection con = getConnection();
		HashMap<String, String> hmap=null;
		
		System.out.println(hosting_id.charAt(0));
		if(hosting_id.charAt(0)=='T'){
		hmap= new MessageDao().hostInfoTrip(con,hosting_id, m_no);
		}else if(hosting_id.charAt(0)=='R'){
		hmap= new MessageDao().hostInfoRoom(con,hosting_id,m_no);
		}else {
			System.out.println("호스팅 정보 못찾 ㅠㅠ");
		}
		
		close(con);
		
		return hmap;
	}

	public int readCheck(int m_no) {
		Connection con = getConnection();
		int result =0;
		result = new MessageDao().readCheck(con,m_no);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int unReadChk(int m_no) {
		Connection con = getConnection();
		int result =0;
		result = new MessageDao().unReadChk(con,m_no);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;

	}

}
