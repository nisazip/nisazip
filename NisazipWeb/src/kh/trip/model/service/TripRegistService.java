package kh.trip.model.service;

import java.sql.Connection;
import java.util.ArrayList;


import kh.trip.model.dao.TripRegistDao;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.TripRegist;

import static kh.common.JDBCTemplate.*;

public class TripRegistService {

	public int insertThumbnail(TripRegist tregist, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new TripRegistDao().insertThumbnailContent(con, tregist);
		
		if(result1 > 0){
			int trno = new TripRegistDao().selectCurrval(con);
			System.out.println(trno);
			
			for(int i = 0; i < fileList.size(); i++){
				fileList.get(i).setBno(trno);
			}
		}
		
		int result2 = new TripRegistDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertTrip(TripRegist tregist) {

		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();
				
		int result = tDao.insertTrip(con, tregist);

		if(result > 0){
			
			commit(con);
		} else{
			
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public TripRegist selectOne(String tno) {


		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();
		
		TripRegist tregist = tDao.selectOne(con, tno);
		
		close(con);
		return tregist;
		
	}

	public int updateTrip(TripRegist tregist) {
		
		Connection con = getConnection();
		int result = new TripRegistDao().updateTrip(con, tregist);
		
		if( result > 0 ){
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public TripRegist selectRecent(String tno) {
		Connection con = getConnection();
		TripRegistDao tDao = new TripRegistDao();
		
		TripRegist tregist = tDao.selectRecent(con, tno);
		
		close(con);
		return tregist;
	}
}
