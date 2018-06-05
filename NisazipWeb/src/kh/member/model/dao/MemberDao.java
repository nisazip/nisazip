package kh.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

import static kh.common.JDBCTemplate.*;

import kh.member.model.vo.Member;
import kh.member.model.vo.UserPic;

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
				member.setEmail(rset.getString("EMAIL"));
				if(rset.getString("GENDER")==null){
					member.setGender("무".charAt(0));
				}else member.setGender(rset.getString("GENDER").charAt(0));	
				member.setBirthdate(rset.getString("BIRTHDATE"));		
				member.setPhone(rset.getString("PHONE"));
				member.setJoin_date(new Date(rset.getDate("JOIN_DATE").getTime()));
				//System.out.println("date:"+new Date(rset.getDate("JOIN_DATE").getTime()));
				member.setLikerooms(rset.getString("LIKEROOMS"));
				member.setLiketrips(rset.getString("LIKETRIPS"));
				member.setR_hosting(rset.getInt("R_HOSTING"));
				member.setT_hosting(rset.getInt("T_HOSTING"));
			
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
				member.setUser_no(rset.getInt("USER_NO"));
				member.setUser_id(rset.getString("USER_ID"));
				member.setPassword(m.getPassword());
				member.setEmail(m.getEmail());
				member.setUser_name(rset.getString("USER_NAME"));
				if(rset.getString("GENDER")==null){
					member.setGender("무".charAt(0));
				}else member.setGender(rset.getString("GENDER").charAt(0));	
				member.setBirthdate(rset.getString("BIRTHDATE"));
				member.setJoin_date(new Date(rset.getDate("JOIN_DATE").getTime()));
				//System.out.println("date:"+new Date(rset.getDate("JOIN_DATE").getTime()));
				member.setPhone(rset.getString("PHONE"));
				member.setLikerooms(rset.getString("LIKEROOMS"));
				member.setLiketrips(rset.getString("LIKETRIPS"));
				member.setR_hosting(rset.getInt("R_HOSTING"));
				member.setT_hosting(rset.getInt("T_HOSTING"));
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


	public int checkEmail(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		System.out.println("dao:" + email);		

		try { 
			String query = prop.getProperty("checkEmail");	
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()){
				System.out.println("rset:" + email);		
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

	public int insertProfile(Connection con, UserPic pic) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("insertProfile");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pic.getUser_id());
			pstmt.setString(2, pic.getOrigin_name());
			pstmt.setString(3, pic.getChange_name());
			pstmt.setString(4, pic.getFile_path());

			result = pstmt.executeUpdate();
			System.out.println("dao:"+pic);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteProfile(Connection con, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("deleteProfile");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
		

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

	public UserPic findUserPic(Connection con, UserPic pic) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserPic profile = null;
		
		try { 
			
			String query = prop.getProperty("findUserPic");
					
			pstmt = con.prepareStatement(query);
			System.out.println("dao"+pic);
			pstmt.setString(1, pic.getUser_id());		
			System.out.println("dao:"+pic.getUser_id());
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				profile = new UserPic();
				profile.setUser_id(pic.getUser_id());
				profile.setFile_level(rset.getInt("FILE_LEVEL"));
				profile.setFile_path(rset.getString("FILE_PATH"));
				profile.setOrigin_name(rset.getString("ORIGIN_NAME"));
				profile.setChange_name(rset.getString("CHANGE_NAME"));
				profile.setUpload_date(rset.getDate("UPLOAD_DATE"));
				System.out.println("sel: "+pic);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return profile;
	}

	public int deleteCertification(Connection con, String id) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("deleteCertification");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
		

			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertCertication(Connection con, UserPic pic) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String query = prop.getProperty("insertCertification");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, pic.getUser_id());
			pstmt.setString(2, pic.getOrigin_name());
			pstmt.setString(3, pic.getChange_name());
			pstmt.setString(4, pic.getFile_path());
		
			result = pstmt.executeUpdate();
			System.out.println("dao:"+pic);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public UserPic findUserCer(Connection con, UserPic pic) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		UserPic profile = null;
		
		try { 
			
			String query = prop.getProperty("findUserCer");
					
			pstmt = con.prepareStatement(query);
			System.out.println("dao"+pic);
			pstmt.setString(1, pic.getUser_id());		
			System.out.println("dao:"+pic.getUser_id());
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				profile = new UserPic();
				profile.setUser_id(pic.getUser_id());
				profile.setFile_level(rset.getInt("FILE_LEVEL"));
				profile.setFile_path(rset.getString("FILE_PATH"));
				profile.setOrigin_name(rset.getString("ORIGIN_NAME"));
				profile.setChange_name(rset.getString("CHANGE_NAME"));
				profile.setUpload_date(rset.getDate("UPLOAD_DATE"));
				
				System.out.println("sel: "+pic);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return profile;
	}
}
