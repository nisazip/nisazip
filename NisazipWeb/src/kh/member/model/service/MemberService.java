package kh.member.model.service;

import kh.member.model.dao.MemberDao;
import kh.member.model.vo.Member;
import kh.member.model.vo.UserPic;

import java.sql.*;
import static kh.common.JDBCTemplate.*;

public class MemberService {
	private MemberDao mDao;
	
	public MemberService() {
		mDao = new MemberDao();
	}
	
	
	public int insertMember(Member m) {
		Connection con = getConnection();
	
		int result = mDao.insertMember(con, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int updateMember(Member m) {
		Connection con = getConnection();
		
		int result = mDao.updateMember(con, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteMember(String userId) {
		Connection con = getConnection();
		
		int result = mDao.deleteMember(con, userId);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Member selectMemberI(Member m) {
		Connection con = getConnection();
		
		Member member = mDao.selectMemberI(con, m);
		
		close(con);
		
		return member;
	}

	public Member selectMemberE(Member m) {
		Connection con = getConnection();
		
		Member member = mDao.selectMemberE(con, m);
		
		close(con);
		
		return member;
	}


	public int checkId(String id) {
		
		
		int result =0;	
		Connection con = getConnection();
		result = mDao.checkId(con, id);
		close(con);
		return result ;
		
	}


	public int checkEmail(String email) {
		int result =0;	
		Connection con = getConnection();
		result = mDao.checkEmail(con, email);
		close(con);
		return result ;
	}

	public int insertProfile(UserPic pic) {
		int result =0;	
		Connection con = getConnection();
		result = mDao.insertProfile(con, pic);
		close(con);
		return result ;
	}


	public int deleteProfile(String id) {
		int result =0;	
		Connection con = getConnection();
		result = mDao.deleteProfile(con, id);
		close(con);
		return result ;
	}


	public UserPic findUserPic(UserPic pic) {
		Connection con = getConnection();
		UserPic profile = mDao.findUserPic(con, pic);
		
		return profile;

		
		
	}
	

}
