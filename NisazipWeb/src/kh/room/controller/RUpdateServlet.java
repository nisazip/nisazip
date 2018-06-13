package kh.room.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import kh.common.MyFileRenamePolicy;
import kh.room.model.service.rService;
import kh.room.model.vo.Attachment;
import kh.room.model.vo.Room;

/**
 * Servlet implementation class SUpdateServlet
 */
@WebServlet("/roomUpdate.no")
public class RUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		rService rs = new rService();
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/resources");
			System.out.println(root);

			String savePath = root + "/room_images/";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String R_NUM = request.getParameter("num");
			String R_NAME = multiRequest.getParameter("R_NAME");
			int R_MAX_NUM = Integer.parseInt(multiRequest.getParameter("R_MAX_NUM"));
			int ROOM_NUM = Integer.parseInt(multiRequest.getParameter("ROOM_NUM"));
			int BED_NUM = Integer.parseInt(multiRequest.getParameter("BED_NUM"));
			int TOILET_NUM = Integer.parseInt(multiRequest.getParameter("TOILET_NUM"));
			String R_DETAIL = multiRequest.getParameter("R_DETAIL");
			String R_RULE = String.join("○ ", multiRequest.getParameterValues("R_RULE"));
			String R_OPTION = String.join(", ", multiRequest.getParameterValues("R_OPTION"));
			String R_START_DATE = multiRequest.getParameter("R_START_DATE");
			String R_END_DATE = multiRequest.getParameter("R_END_DATE");
			int PRICE = Integer.parseInt(multiRequest.getParameter("PRICE"));
			String R_ADDR = multiRequest.getParameter("zipCode") + ", " + multiRequest.getParameter("address1") + ", "
					+ multiRequest.getParameter("address2");

			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();
			ArrayList<Attachment> originList = (ArrayList<Attachment>)rs.selectOne(R_NUM).get("fileList");
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			updatePicture(multiRequest, 0, originList, fileList, "thumbnailImg1");
			updatePicture(multiRequest, 1, originList, fileList, "thumbnailImg2");
			updatePicture(multiRequest, 2, originList, fileList, "thumbnailImg3");
			
			Attachment titleImg = fileList.get(0);
			Attachment detailImg1 = fileList.get(1);
			Attachment detailImg2 = fileList.get(2);

			System.out.println("titleImg : " + titleImg);
			System.out.println("detailImg1 : " + detailImg1);
			System.out.println("detailImg2 : " + detailImg2);

			Room room = new Room();
			room.setR_id(R_NUM);
			room.setR_name(R_NAME);
			room.setR_max_num(R_MAX_NUM);
			room.setRoom_num(ROOM_NUM);
			room.setBed_num(BED_NUM);
			room.setToilet_num(TOILET_NUM);
			room.setR_detail(R_DETAIL);
			room.setR_rule(R_RULE);
			room.setR_option(R_OPTION);
			room.setR_start_date(R_START_DATE);
			room.setR_end_date(R_END_DATE);
			room.setPrice(PRICE);
			room.setR_addr(R_ADDR);

			// System.out.println(fileName);

			System.out.println(room);
			System.out.println("서블릿 확인: " + fileList);
			
			int updateSearch = rs.updateSearch(R_NUM);
			
			if(updateSearch == 0){
				
				int result = rs.updateRoom(room);
				int result2 = rs.updatePicture(fileList);

				String page = "";
				if (result > 0 || result2 > 0) {
					page = "views/room/Roomlist.jsp";
					request.setAttribute("list", rs.selectList());
				} else {
					System.out.println("수정 실패!");
					page = "views/common/errorPage.jsp";
				}
				request.getRequestDispatcher(page).forward(request, response);
				
			} else {
				String uesMsg = "남아있는 예약이 있어서 수정이 불가능 합니다., 남아있는 수정수: " + updateSearch;
				request.setAttribute("uesMsg", uesMsg);
				request.getRequestDispatcher("/views/room/Room.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	// picture update method
	public void updatePicture(MultipartRequest multiRequest, int idx, ArrayList<Attachment> origin_list,
			ArrayList<Attachment> fileList, String name){
		String fileName = multiRequest.getFilesystemName(name);
		String originName = multiRequest.getOriginalFileName(name);
		
		if(fileName == null){
			fileList.add(origin_list.get(idx));
		} else {
			Attachment at = origin_list.get(idx);
			new File(at.getFile_path()+"/"+at.getChange_name()).delete();
			
			at.setOrigin_name(originName);
			at.setChange_name(fileName);
			
			fileList.add(at);
		}
	}

}
