package kh.room.model.dao;



import static kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Properties;

import kh.member.model.vo.Member;
import kh.room.model.vo.Attachment;
import kh.room.model.vo.R_RESERVATION;
import kh.room.model.vo.Room;

public class rDao {
	
	private Properties prop;
	
	public rDao() {
		prop = new Properties();
		String fileName = rDao.class.getResource("/config/room/room_INSERT.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
		public ArrayList<Room> selectList(Connection con) {
		
				ArrayList<Room> list = null;
				Statement stmt = null;
				ResultSet rset = null;
				
				String query = prop.getProperty("selectList");
				
				try {
					stmt = con.createStatement();
					
					rset = stmt.executeQuery(query);
					
					list = new ArrayList<Room>();
					
					while(rset.next()) {
						Room r = new Room();
						
						/*r.setR_name(rset.getString("R_NAME"));*/
						r.setR_id(rset.getString("R_ID"));
						r.setR_name(rset.getString("R_NAME"));
						r.setHost_no(rset.getString("HOST_ID"));
						r.setPrice(rset.getInt("PRICE"));
						r.setR_max_num(rset.getInt("R_MAX_NUM"));
						r.setR_addr(rset.getString("R_ADDR"));
						
						/// 이 부분은 아직 디비에 널이 남아 있어서 넣는 겁니다.
						// 나중에 제거해주세요
						if( rset.getString("R_DATE") == null )
							r.setR_date(new SimpleDateFormat("yy/MM/dd").format(Calendar.getInstance().getTime()));
						else r.setR_date(rset.getString("R_DATE"));
						
						list.add(r);
					}
					
				} catch (SQLException e) {
					
					e.printStackTrace();
					
				} finally {
					close(rset);
					close(stmt);
				}
				
				return list;
	}

	public int insertRoom(Connection con, Room room) {
		int result = 0;
		
		System.out.println("dao전달: "+ room);
		
		PreparedStatement pstmt = null;
		
		try {
			
			String query = prop.getProperty("UpdateRoom2");
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, room.getR_detail());
			pstmt.setString(2, room.getR_rule());
			pstmt.setString(3, room.getR_name());
			pstmt.setString(4, room.getR_start_date());
			pstmt.setString(5, room.getR_end_date());
			pstmt.setInt(6, room.getPrice());			
			pstmt.setString(7, room.getR_addr());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int DeleteRoom(Connection con, String num) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("DeleteRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, num);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateRoom(Connection con, Room room) {
		System.out.println("dao 전달:"+room);
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("updateRoom");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, room.getR_name());
			pstmt.setInt(2, room.getR_max_num());
			pstmt.setInt(3, room.getRoom_num());
			pstmt.setInt(4, room.getBed_num());
			pstmt.setInt(5, room.getToilet_num());
			pstmt.setString(6, room.getR_detail());
			pstmt.setString(7, room.getR_rule());
			pstmt.setString(8, room.getR_option());
			pstmt.setString(9, room.getR_start_date());
			pstmt.setString(10, room.getR_end_date());
			pstmt.setInt(11, room.getPrice());
			pstmt.setString(12, room.getR_addr());
			pstmt.setString(13, room.getR_id());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Object> selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> fileList = null;
		HashMap<String,Object> map = null;
		
		Room r = null;
		
		String query = prop.getProperty("RoomselectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			int i = 0;
			fileList = new ArrayList<Attachment>();
			while(rset.next()){
				if(i == 0){
					// 어차피 전부 중복되니까 숙소 정보는 처음만 받구요
					r = new Room();
					r.setR_id(num);
					r.setR_name(rset.getString("R_NAME"));
					r.setHost_no(rset.getString("HOST_ID"));
					r.setPrice(rset.getInt("PRICE"));
					r.setR_max_num(rset.getInt("R_MAX_NUM"));
					r.setR_addr(rset.getString("R_ADDR"));
					r.setRoom_num(rset.getInt("ROOM_NUM"));
					r.setToilet_num(rset.getInt("TOILET_NUM"));
					r.setBed_num(rset.getInt("BED_NUM"));
					r.setR_detail(rset.getString("R_DETAIL"));
					r.setR_rule(rset.getString("R_ROLE"));
					r.setR_start_date(rset.getString("R_START_DATE"));
					r.setR_end_date(rset.getString("R_END_DATE"));
					r.setR_option(rset.getString("R_OPTION"));
					r.setR_loc(rset.getString("R_LOC"));
					/// 이 부분은 아직 디비에 널이 남아 있어서 넣는 겁니다.
					// 나중에 제거해주세요
					if( rset.getString("R_DATE") == null )
						r.setR_date(new SimpleDateFormat("yy/MM/dd").format(Calendar.getInstance().getTime()));
					else r.setR_date(rset.getString("R_DATE"));
					i++;
				} // 여기서 부터 사진 정보를 받으시면 됩니다.
				
				Attachment at = new Attachment();
				at.setPno(String.valueOf(rset.getInt("PNO")));
				at.setR_id(num);
				at.setHosting_id(rset.getString("HOSTING_ID"));
				at.setOrigin_name(rset.getString("ORIGIN_NAME"));
				at.setChange_name(rset.getString("CHANGE_NAME"));
				at.setFile_path(rset.getString("FILE_PATH"));
				at.setUpload_date(rset.getDate("UPLOAD_DATE").toGMTString());
				at.setFile_level(rset.getInt("FILE_LEVEL"));
				
				fileList.add(at);
			}
			
			map = new HashMap<String,Object>();
			
			map.put("room", r);
			map.put("fileList", fileList);
			
			System.out.println(r);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return map;
	}

	public R_RESERVATION selectTwo(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		R_RESERVATION res = null;
		
		String query = prop.getProperty("RoomReservationselectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				res = new R_RESERVATION();
				res.setR_reser_no(Integer.parseInt(num));
				res.setR_id(rset.getString("R_ID"));
				res.setUser_id(rset.getString("USER_ID"));
				res.setCheck_in(rset.getString("CHECK_IN"));
				res.setCheck_out(rset.getString("CHECK_OUT"));
				res.setTotal_price(rset.getInt("TOTAL_PRICE"));
				res.setPeople(rset.getInt("PEOPLE"));
				
				System.out.println(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return res;
	}

	public ArrayList<R_RESERVATION> selectReservation(Connection con) {
		ArrayList<R_RESERVATION> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReservation");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<R_RESERVATION>();
			
			while(rset.next()) {
				R_RESERVATION r = new R_RESERVATION();
				r.setR_reser_no(rset.getInt(1));
				r.setR_id(rset.getString("R_ID"));
				r.setUser_id(rset.getString(3));
				r.setCheck_in(rset.getString(4));
				r.setCheck_out(rset.getString(5));
				r.setTotal_price(rset.getInt(6));
				r.setPeople(rset.getInt(7));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int ReservationPrice(Connection con, R_RESERVATION res) {
		System.out.println("Dao전달: "+ res);
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertReservation");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, res.getR_id());
			pstmt.setString(2, res.getUser_id());
			pstmt.setString(3, res.getCheck_in());
			pstmt.setString(4, res.getCheck_out());
			pstmt.setInt(5, res.getTotal_price());
			pstmt.setInt(6, res.getPeople());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public R_RESERVATION selectRecent(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM R_RESERVATION ORDER BY 1 DESC";
		R_RESERVATION r = new R_RESERVATION();
		
		
		try{
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()){
				r.setR_reser_no(rset.getInt(1));
				r.setR_id(rset.getString(2));
				r.setUser_id(rset.getString(3));
				r.setCheck_in(rset.getString("CHECK_IN"));
				r.setCheck_out(rset.getString("CHECK_OUT"));
				r.setTotal_price(rset.getInt(6));
				r.setPeople(rset.getInt(7));
			}
		} catch (SQLException e) {
			
		} finally {
			
		}
		return r;
	}

	public ArrayList<R_RESERVATION> selectReservationlist(Connection con) {
		ArrayList<R_RESERVATION> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReservation");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<R_RESERVATION>();
			
			while(rset.next()) {
				R_RESERVATION r = new R_RESERVATION();
				r.setR_reser_no(rset.getInt(1));
				r.setR_id(rset.getString("R_ID"));
				r.setUser_id(rset.getString(3));
				r.setCheck_in(rset.getString(4));
				r.setCheck_out(rset.getString(5));
				r.setTotal_price(rset.getInt(6));
				r.setPeople(rset.getInt(7));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}

	public int insertThumbnailContent(Connection con, Room room, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertRoom1");
		System.out.println(query);
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "TEST");
			pstmt.setString(2, m.getUser_id());
			pstmt.setInt(3, room.getR_max_num());
			pstmt.setString(4, room.getR_type());
			pstmt.setString(5, room.getR_type2());
			pstmt.setString(6, room.getR_option());
			pstmt.setInt(7, room.getRoom_num());
			pstmt.setInt(8, room.getToilet_num());
			pstmt.setInt(9, room.getBed_num());
			pstmt.setString(10, "TEST");
			pstmt.setString(11, room.getR_rule());
			pstmt.setInt(12, 1000);
			pstmt.setString(13, "지역");
			pstmt.setString(14, room.getR_addr());
			pstmt.setString(15, "1000");
			pstmt.setString(16, room.getR_start_date());
			pstmt.setString(17, room.getR_end_date());
			pstmt.setFloat(18, room.getScore());
			
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
		int tno = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				tno = rset.getInt("currval");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return tno;
	}

	public int insertAttachment(Connection con, String r_id, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");
		System.out.println(fileList);

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				
				
				pstmt.setString(1, r_id);
				pstmt.setString(2, "HOST");
				pstmt.setString(3, fileList.get(i).getOrigin_name());
				pstmt.setString(4, fileList.get(i).getChange_name());
				pstmt.setString(5, fileList.get(i).getFile_path());
				

				int level = 0;
				if (i != 0)
					level = 1;

				pstmt.setInt(6, level);

				result = pstmt.executeUpdate();
			}
			System.out.println("result : " + result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updatePicture(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("i");
		System.out.println("디에이오 전달: "+fileList);
		
		try{
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "HOST");
				pstmt.setString(2, fileList.get(i).getOrigin_name());
				pstmt.setString(3, fileList.get(i).getChange_name());
				pstmt.setString(4, fileList.get(i).getFile_path());
				
				int level = 0;
				if (i != 0)
					level = 1;

				pstmt.setInt(5, level);
				pstmt.setString(6, fileList.get(i).getPno());
					
				result = pstmt.executeUpdate();
			}
			System.out.println("result: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int tripTotalCount(Connection con, String r_id, String check_in, String check_out) {
		int result = 0;
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String query = prop.getProperty("RoomTotalCount");
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, check_in);
			pstmt.setString(2, check_out);
			pstmt.setString(3, r_id);
		
			
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getInt("PEOPLE");
			}
			
			System.out.println("예약 인원 제한 Dao : " + result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/*public int multipleRes(Connection con, Room room) {
		System.out.println("dao 전달: "+ room);
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("ResMultiple");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, room.getPrice());
			pstmt.setInt(2, room.getPeople());
			pstmt.setInt(3, room.getDay());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
*/
	


}
