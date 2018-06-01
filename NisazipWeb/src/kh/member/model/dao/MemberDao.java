package kh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

import static kh.common.JDBCTemplate.*;

import kh.member.model.vo.Member;

public class MemberDao {
	private Properties prop;
	
	public MemberDao() {
		prop = new Properties();
		String fileName = MemberDao.class.getResource("/config/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}


	public int insertMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("insertMember");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getUser_id());
			pstmt.setString(2, m.getPassword());
			pstmt.setString(3, m.getUser_name());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getBirthdate());
			result = pstmt.executeUpdate();
			System.out.println("dao"+m);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {			
			String query = prop.getProperty("updateMember");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, m.getUser_name());
			pstmt.setString(2, String.valueOf(m.getGender()));
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getBirthdate());
			pstmt.setString(5, m.getUser_id());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteMember(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("deleteMember");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	public Member selectMemberI(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		try { 
			
			String query = prop.getProperty("loginMemberI");
					
			pstmt = con.prepareStatement(query);
			System.out.println("dao"+m);
			pstmt.setString(1, m.getUser_id());
			pstmt.setString(2, m.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				
				member.setUser_id(m.getUser_id());
				member.setPassword(m.getPassword());
				member.setUser_no(rset.getInt("USER_NO"));
				member.setUser_name(rset.getString("USER_NAME"));
				member.setGender(rset.getString("GENDER").charAt(0));	
				member.setBirthdate(rset.getString("BIRTHDATE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setPhone(rset.getString("PHONE"));
				System.out.println("sel"+m);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	public Member selectMemberE(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		try { 
			
			String query = prop.getProperty("loginMemberE");
					
			pstmt = con.prepareStatement(query);
			System.out.println("dao"+m);
			pstmt.setString(1, m.getEmail());
			pstmt.setString(2, m.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				member = new Member();
				
				member.setUser_id("USER_ID");
				member.setPassword(m.getPassword());
				member.setEmail(m.getEmail());
				member.setUser_name(rset.getString("USER_NAME"));
				member.setGender(rset.getString("GENDER").charAt(0));	
				member.setBirthdate(rset.getString("BIRTHDATE"));
				
				member.setPhone(rset.getString("PHONE"));
				System.out.println("sel"+m);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}


	public int checkId(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("dao:" + id);		

		try { 
			String query = prop.getProperty("checkId");	
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rset = pstmt.executeQuery();
			if(rset.next()){
				System.out.println("rset:" + id);		
				return 1;
			
			}else{
				
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return 0;
	}

}
