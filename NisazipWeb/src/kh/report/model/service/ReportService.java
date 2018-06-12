package kh.report.model.service;

import static kh.common.JDBCTemplate.commit;
import static kh.common.JDBCTemplate.getConnection;
import static kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import kh.report.model.dao.ReportDao;
import kh.report.model.vo.Report;
public class ReportService {

	public int reportInsert(Report rp) {
		Connection con = getConnection();
		int result =0;
		
		result = new ReportDao().reportInsert(con, rp);
		
		if(result>0) commit(con);
		else rollback(con);
		
		
		return result;
	}

}
