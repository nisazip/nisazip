package kh.board.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import kh.board.model.dao.BoardDao;
import kh.board.model.vo.Board;
public class BoardService {

/*	public ArrayList<Board> boardList() {
	
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().boardList(con);

		close(con);
		
		return list;
	}*/

	// 게시글 선택
	public Board boardSelect(int b_no) {
		
		Connection con = getConnection();
		BoardDao bdao = new BoardDao();
		int result =0;
		
		Board b = bdao.boardSelect(con, b_no);
		
		// 조회수 증가
		StackTraceElement[] caller = new Throwable().getStackTrace();
		
		if(b != null && caller[1].getClassName().contains("BoardSelect")){
			result = bdao.countUpdate(con,b);
			
			if(result>0) commit(con);
			else rollback(con);
		}
			
		close(con);
		
		return b;
	}

	// 게시글 등록
	public int boardInsert(Board b) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().boardInsert(con, b);
		
		if(result>0) commit(con); 
		else rollback(con);
		
		close(con);
		
		return result;
	}


	// 게시글 수정
	public int boardUpdate(Board b) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().boardUpdate(con, b);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	// 게시글 삭제
	public int boardDelete(int b_no) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().boardDelete(con, b_no);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	
	// 게시글 수
	public int getListCount() {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().getListCount(con);
		
		close(con);
		
		return result;
	}

	// 게시글 전체조회
	public ArrayList<Board> boardList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = null;
		
		list = new BoardDao().boardList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	// 게시글 검색 조회
	public ArrayList<Board> boardSearch(String condition, String keyword, int currentPage, int limit) {
		Connection con =getConnection();
		ArrayList<Board> list =null;
		BoardDao bdao = new BoardDao();
		
		if(condition.equals("title")){
			list = bdao.boardSearchTitle(con,keyword,currentPage, limit);
		}else if (condition.equals("writer")){
			list = bdao.boardSearchWriter(con,keyword,currentPage, limit);
		}else if(condition.equals("content")){
			list = bdao.boardSearchContent(con,keyword,currentPage, limit);
		}else{
			list = bdao.boardList(con,currentPage, limit);
		}
		
		close(con);
		
		return list;
	}

	public int getListCountTitle(String keyword) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().getListCountTitle(con, keyword);
		
		close(con);
		
		return result;
	}

	public int getListCountWriter(String keyword) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().getListCountWriter(con, keyword);
		
		close(con);
		
		return result;
	}

	public int getListCountContent(String keyword) {
		Connection con = getConnection();
		int result =0;
		
		result = new BoardDao().getListCountContent(con, keyword);
		
		close(con);
		
		return result;
	}

	public Board prevBoard(int b_no) {
		Connection con = getConnection();
		Board b= null;
		b = new BoardDao().prevBoard(con, b_no);
	
		close(con);
		
		return b;
	}
	
	public Board nextBoard(int b_no) {
		Connection con = getConnection();
		Board b= null;
		b = new BoardDao().nextBoard(con, b_no);
	
		close(con);
		
		return b;
	}
}
