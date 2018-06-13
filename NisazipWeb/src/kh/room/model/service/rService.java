package kh.room.model.service;



import static kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.member.model.vo.Member;
import kh.room.model.dao.rDao;
import kh.room.model.vo.Attachment;
import kh.room.model.vo.R_RESERVATION;
import kh.room.model.vo.Room;

public class rService {

	
	public ArrayList<Room> selectList() {
		Connection con = getConnection();
		ArrayList<Room> list = new rDao().selectList(con);
		close(con);
		return list;
	}

	
	public int insertRoom(Room room) {
		
		System.out.println("서비스 전달: "+room);
		
		Connection con = getConnection();
		
		rDao rd = new rDao();
		
		int result = rd.insertRoom(con, room);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	

	public int updateRoom(Room room) {
		Connection con = getConnection();
		
		System.out.println("서비스전달:"+room);
		
		int result = new rDao().updateRoom(con, room);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public HashMap<String,Object> selectOne(String num) {
		Connection con = getConnection();
		HashMap<String,Object> map = new rDao().selectOne(con, num);
		
		close(con);
		
		return map;
	}


	public R_RESERVATION selectTwo(String num) {
		Connection con = getConnection();
		
		R_RESERVATION res = new rDao().selectTwo(con, num);
		
		close(con);
		
		return res;
	}


	public int DeleteRoom(String num) {
		Connection con = getConnection();
		
		int result = new rDao().DeleteRoom(con, num);

		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public ArrayList<R_RESERVATION> selectReservation() {
		
		Connection con = getConnection();
		ArrayList<R_RESERVATION> list = new rDao().selectReservation(con);
		close(con);
		return list;
	}


	public int ReservationPrice(R_RESERVATION res) {
		Connection con = getConnection();
		
		int result = new rDao().ReservationPrice(con, res);
		
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public R_RESERVATION selectRecent(R_RESERVATION res) {
		Connection con = getConnection();
		
		R_RESERVATION r = new rDao().selectRecent(con, res);
		
		close(con);
		
		return r;
	}


	public ArrayList<R_RESERVATION> selectReservationlist() {
		Connection con = getConnection();
		ArrayList<R_RESERVATION> list = new rDao().selectReservationlist(con);
		close(con);
		return list;
	}

	public String insertThumnail(Room room, ArrayList<Attachment> fileList, Member m) {
		Connection con = getConnection();
		int result = 0;
		int pno = 0;
		int selectVal = 0;
		int result1 = new rDao().insertThumbnailContent(con,room,m);
		
		if(result1 > 0){
			// 현재 추가된 방의 번호 조회
			selectVal = new rDao().selectCurrval(con);
			System.out.println("번호: "+pno);
			
			for(int i = 0; i < fileList.size(); i++){
				fileList.get(i).setPno("R" + (pno - 1));
			}
		}
		int result2 = new rDao().insertAttachment(con, ("R"+selectVal), fileList);
		if (result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return "R" + (pno - 1);
	}


	public int updatePicture(ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		System.out.println("서비스 전달: " + fileList);
		
		int result = new rDao().updatePicture(con, fileList);

		if (result > 0)
			commit(con);
		else
			rollback(con);

		close(con);

		return result;
	}


	public int roomTotalcount(String r_id, String check_in, String check_out) {
		Connection con = getConnection();
		
		int result = new rDao().tripTotalCount(con, r_id, check_in, check_out);
		
		System.out.println("예약 인원 제한 Service : " + result);
		
		close(con);
		
		return result;	
	}


	public int deleteSearch(String num) {
		Connection con = getConnection();
		
		int result = new rDao().deleteSearch(con, num);
		System.out.println("DeleteSearch 서비스단에서 r_id : "+num);
		close(con);
		
		return result;
	}


	public int updateSearch(String r_NUM) {
		Connection con = getConnection();
		
		int result = new rDao().updateSearch(con, r_NUM);
		System.out.println("UpdateSearch 서비스단에서 r_id : "+r_NUM);
		close(con);
		
		return result;
	}


	public int DeleteReservation(String resname, int price) {
		System.out.println("예약 취소 서비스 접근 성공!!!");
		
		Connection con = getConnection();
		
		int result = new rDao().DeleteReservation(con, resname, price);

		System.out.println("예약 취소 Service result : " + result);
		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	/*public int multipleRes(Room room) {
		Connection con = getConnection();
		
		int result = new rDao().multipleRes(con, room);

		if( result > 0 ) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}*/


	


	
	

}
