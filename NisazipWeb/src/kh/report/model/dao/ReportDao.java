package kh.report.model.dao;

import static kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;


import kh.report.model.vo.Report;

public class ReportDao {
	private Properties prop;
	
	public ReportDao(){
		prop = new Properties();
		
		String fileName = ReportDao.class.getResource("/config/report/report-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int reportInsert(Connection con, Report rp) {
		int result=0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("reportInsert");
		
		try {
			pstmt= con.prepareStatement(query);
			
			pstmt.setString(1, rp.getRp_writer());
			pstmt.setString(2, rp.getRp_receiver());
			pstmt.setString(3, rp.getRp_type());
			pstmt.setString(4, rp.getRp_content());
		
			result =pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		
		return result;
	}

}
