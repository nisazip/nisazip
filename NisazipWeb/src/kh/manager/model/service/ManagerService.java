package kh.manager.model.service;

import static kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import kh.manager.model.dao.mDao;
import kh.member.model.vo.Member;
import kh.room.model.vo.Room;

public class ManagerService {


	
	public ArrayList<Member> mList() {
		Connection con = getConnection();
		
		ArrayList<Member> list = new mDao().mList(con);
		
		close(con);
		return list;
	}

	public ArrayList<Room> rList() {
		Connection con = getConnection();
		
		ArrayList<Room> list = new mDao().rList(con);
		
		close(con);
		
		return list;
	}

}
