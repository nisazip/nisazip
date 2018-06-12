package kh.message.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import kh.message.model.dao.MessageContentDao;
import kh.message.model.vo.MessageContent;
public class MessageContentService {

	public int msInsert(MessageContent ms) {
		Connection con=  getConnection();
		int result =0;
		result = new MessageContentDao().msInsert(con,ms);
		
		if(result >0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<MessageContent> msList(int m_no) {
		Connection con=  getConnection();
		ArrayList<MessageContent> mclist = null;
		
		mclist= new MessageContentDao().msList(con,m_no);
		
		
		close(con);
		
		return mclist;
	}

}
