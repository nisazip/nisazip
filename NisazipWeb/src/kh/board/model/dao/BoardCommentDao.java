package kh.board.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import kh.board.model.vo.BoardComment;

public class BoardCommentDao {

	private Properties prop;
	
	public BoardCommentDao() {
		
		prop =new Properties();
		
		String fileName = BoardCommentDao.class.getResource("/config/board/boardComment-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public int commentInsert(Connection con, BoardComment bc) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("commentInsert");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, bc.getB_no());
			pstmt.setString(2, bc.getC_content());
			pstmt.setString(3, bc.getC_writer());
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<BoardComment> commentList(Connection con, int b_no) {
		ArrayList<BoardComment> clist =null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		String query = prop.getProperty("commentList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b_no);
			
			rs=pstmt.executeQuery();
			
			clist = new ArrayList<BoardComment>();
			while(rs.next()){
				BoardComment bc = new BoardComment();
				
				bc.setB_no(b_no);
				bc.setC_no(rs.getInt("c_no"));
				bc.setC_content(rs.getString("c_content"));
				bc.setC_writer(rs.getString("c_writer"));
				bc.setC_date_time(rs.getString("c_date_time"));
				
				clist.add(bc);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return clist;
	}

	public int commentDelete(Connection con, int c_no) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("commentDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, c_no);
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int commentUpdate(Connection con, BoardComment bc) {
		int result =0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("commentUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, bc.getC_content());
			pstmt.setInt(2, bc.getC_no());
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}

	public int commentCheck(Connection con, int b_no) {
		int result =0;
		ResultSet rs= null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("commentCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, b_no);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				result =rs.getInt(1);
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
		
	}

}
