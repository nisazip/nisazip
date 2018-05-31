package kh.semi.trip.model.dao;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Properties;

import kh.semi.trip.model.vo.Attachment;
import kh.semi.trip.model.vo.TripRegist;

import static kh.semi.common.JDBCTemplate.*;

public class TripRegistDao {
	
	private Properties prop;
	
	public TripRegistDao() {
		prop = new Properties();
		
		String fileName = TripRegistDao.class.getResource("/config/trip/tripName.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertTripName(Connection con, TripRegist tregist) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("tregistDAO : " + tregist);
		
		String query = prop.getProperty("insertName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tregist.getTrip_name());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("result : "+ result);
		return result;
	}

	public int insertThumbnailContent(Connection con, TripRegist tregist) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, tregist.getTrip_name());
			pstmt.setString(2, tregist.getTrip_introduce());
			pstmt.setNull(3, Types.VARCHAR);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bno = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				bno = rset.getInt("currval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}

		return bno;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");
		System.out.println(fileList);

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fileList.get(i).getBno());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());

				int level = 0;
				if (i != 0)
					level = 1;

				pstmt.setInt(5, level);

				result += pstmt.executeUpdate();
			}
			System.out.println("result : " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

}
