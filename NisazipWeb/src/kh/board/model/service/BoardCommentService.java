package kh.board.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import kh.board.model.dao.BoardCommentDao;
import kh.board.model.vo.BoardComment;

public class BoardCommentService {

	public int commentInsert(BoardComment bc) {
		Connection con =getConnection();
		int result=0;
		
		result = new BoardCommentDao().commentInsert(con, bc);
		
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
			
		return result;
	
	}

	public ArrayList<BoardComment> commentList(int b_no) {
		Connection con = getConnection();
		ArrayList<BoardComment> clist = new BoardCommentDao().commentList(con, b_no);
		
		close(con);
		
		
		return clist;
	}

	public int commentDelete(int c_no) {
		Connection con =getConnection();
		int result=0;
		
		result = new BoardCommentDao().commentDelete(con, c_no);
		
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
			
		return result;
	}

	public int commentUpdate(BoardComment bc) {
		Connection con =getConnection();
		int result=0;
		
		result = new BoardCommentDao().commentUpdate(con, bc);
		
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
			
		return result;
		
	}
	
	public int commentCheck(int b_no){
		Connection con =getConnection();
		int result=0;
		
		result = new BoardCommentDao().commentCheck(con, b_no);
		
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
			
		return result;
		
	}

}
