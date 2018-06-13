package kh.review.model.service;

import static kh.common.JDBCTemplate.close;
import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import kh.review.model.dao.ReviewDao;
import kh.review.model.vo.Review;
public class ReviewService {

	public int reviewInsert(Review re) {
		Connection con = getConnection();
		int result=0;
		
		result = new ReviewDao().reviewInsert(con, re);
		
		if(result>0) commit(con);
		else rollback(con);
			
		close(con);
		
		return result;
	
	}

	public ArrayList<HashMap<String, Object>> reviewListScore(String hosting_id) {
		Connection con =getConnection();
		ArrayList<HashMap<String, Object>> rlist= null;
		
		rlist = new ReviewDao().reviewListScore(con,hosting_id);
		
		
		close(con);
		
		return rlist;
	}

	public int checkInfo(String hosting_id, String user_id) {
		Connection con =getConnection();
		int result =0;
		
		
		if(hosting_id.charAt(0)=='T'){
			result = new ReviewDao().checkInfoTrip(con, hosting_id, user_id);
		}else if(hosting_id.charAt(0)=='R'){
			result = new ReviewDao().checkInfoRoom(con, hosting_id, user_id);
		} else{
			System.out.println("이용 내역이 없다");
		}
			
	
		close(con);
		
		return result;
	}

	public int reviewDelete(int review_no) {
		Connection con =getConnection();
		int result =0;
		
		result = new ReviewDao().reviewDelete(con,review_no);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> reviewListTime(String hosting_id) {
		Connection con =getConnection();
		ArrayList<HashMap<String, Object>> rlist= null;
		
		rlist = new ReviewDao().reviewListTime(con,hosting_id);
		
		close(con);
		
		return rlist;
	}

	public ArrayList<HashMap<String, Object>> reviewListScoreAsc(String hosting_id) {
		Connection con =getConnection();
		ArrayList<HashMap<String, Object>> rlist= null;
		
		rlist = new ReviewDao().reviewListScoreAsc(con,hosting_id);
		
		close(con);
		
		return rlist;
	}


}
