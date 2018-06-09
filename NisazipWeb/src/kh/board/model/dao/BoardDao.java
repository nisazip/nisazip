package kh.board.model.dao;


import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import kh.board.model.vo.Board;

public class BoardDao {
	private Properties prop ;
	
	public BoardDao(){
		prop = new Properties();
		
		String fileName = BoardDao.class.getResource("/config/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Board boardSelect(Connection con, int b_no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;

		String query = prop.getProperty("boardSelect");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, b_no);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				b= new Board();
				String b_title= rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("USER_NAME");
				int b_count = rs.getInt("b_count");
				Date b_date = rs.getDate("b_date");
				String delflag = rs.getString("delflag");
				String b_date_time = rs.getString("b_date_time");
				
				b.setB_no(b_no);
				b.setB_title(b_title);
				b.setB_content(b_content);
				b.setB_writer(b_writer);
				b.setB_count(b_count);
				b.setB_date(b_date);
				b.setDelflag(delflag);
				b.setB_date_time(b_date_time);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return b;
	}



	public int countUpdate(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("countUpdate");
				
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, b.getB_no());
			
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public int boardInsert(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query =prop.getProperty("boardInsert");
				
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, b.getB_title());
			pstmt.setString(2, b.getB_content());
			pstmt.setString(3, b.getB_writer());
			
			result =pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int boardUpdate(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("boardUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getB_title());
			pstmt.setString(2, b.getB_content());
			pstmt.setInt(3, b.getB_no());
			
			result= pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int boardDelete(Connection con, int b_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query =prop.getProperty("boardDelete");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, b_no);
		
			result= pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		int result =0;
		Statement stmt  = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("getListCount");
			
		try {
			stmt =con.createStatement();
			
			 rs =stmt.executeQuery(query);
			if(rs.next()){
				result = rs.getInt(1);
				
			
			} 
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(stmt);
		}
		
		return result;
	}

	public ArrayList<Board> boardList(Connection con, int currentPage, int limit) {
		ArrayList<Board> list = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("boardList3");
				 
		
		
		try {

			pstmt = con.prepareStatement(query);
			
			//조회할 숫자: startRow 와 endRow 계산
			int startRow = (currentPage -1) * limit +1; // 10대신 limit
			int endRow= startRow + (limit-1);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs =pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()){
				
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("USER_NAME");
				int b_count = rs.getInt("b_count");
				Date b_date = rs.getDate("b_date");
				String delflag = rs.getString("delflag");
				
				list.add( new Board(b_no, b_title, b_content, b_writer, b_count, b_date, delflag));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	




	public ArrayList<Board> boardSearchContent(Connection con, String keyword, int currentPage, int limit) {
		ArrayList<Board> list = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query =prop.getProperty("boardSearchContent");
				 
		
		
		try {

			pstmt = con.prepareStatement(query);
			
			//조회할 숫자: startRow 와 endRow 계산
			int startRow = (currentPage -1) * limit +1; // 10대신 limit
			int endRow= startRow + (limit-1);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs =pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()){
				
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("USER_NAME");
				int b_count = rs.getInt("b_count");
				Date b_date = rs.getDate("b_date");
				String delflag = rs.getString("delflag");
				
				list.add( new Board(b_no, b_title, b_content, b_writer, b_count, b_date, delflag));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	
	}

	public ArrayList<Board> boardSearchTitle(Connection con, String keyword, int currentPage, int limit) {
		ArrayList<Board> list = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query =prop.getProperty("boardSearchTitle");
				 
		
		
		try {

			pstmt = con.prepareStatement(query);
			
			//조회할 숫자: startRow 와 endRow 계산
			int startRow = (currentPage -1) * limit +1; // 10대신 limit
			int endRow= startRow + (limit-1);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs =pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()){
				
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("USER_NAME");
				int b_count = rs.getInt("b_count");
				Date b_date = rs.getDate("b_date");
				String delflag = rs.getString("delflag");
				
				list.add( new Board(b_no, b_title, b_content, b_writer, b_count, b_date, delflag));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> boardSearchWriter(Connection con, String keyword, int currentPage, int limit) {
		ArrayList<Board> list = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = prop.getProperty("boardSearchWriter");
				  
		
		
		try {

			pstmt = con.prepareStatement(query);
			
			//조회할 숫자: startRow 와 endRow 계산
			int startRow = (currentPage -1) * limit +1; // 10대신 limit
			int endRow= startRow + (limit-1);
			
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs =pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()){
				
				int b_no = rs.getInt("b_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				String b_writer = rs.getString("USER_NAME");
				int b_count = rs.getInt("b_count");
				Date b_date = rs.getDate("b_date");
				String delflag = rs.getString("delflag");
				
				list.add( new Board(b_no, b_title, b_content, b_writer, b_count, b_date, delflag));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return list;
	}




	public int getListCountTitle(Connection con, String keyword) {
		int result =0;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String query = prop.getProperty("getListCountTitle");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			
			rs =pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);

			} 
		
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return result;
	}



	public int getListCountWriter(Connection con, String keyword) {  // 작성자 수ㅈㅇ
		int result =0;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String query = prop.getProperty("getListCountWriter");
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			
			rs =pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
				
			
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return result;
	}



	public int getListCountContent(Connection con, String keyword) {
		int result =0;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		String query = prop.getProperty("getListCountContent") ;
			
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, keyword);
			
			rs =pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt(1);
		
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public Board prevBoard(Connection con, int b_no) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query =prop.getProperty("prevBoard");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, b_no);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				b= new Board();
				b.setB_no(rs.getInt(1));
				b.setB_title(rs.getString(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return b;
	}

	public Board nextBoard(Connection con, int b_no) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query =prop.getProperty("nextBoard");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, b_no);
			
			rs =pstmt.executeQuery();
			
			if(rs.next()){
				b= new Board();
				b.setB_no(rs.getInt(1));
				b.setB_title(rs.getString(2));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return b;
	}

	


}
