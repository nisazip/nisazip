package kh.trip.controller;

import java.io.File;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.common.MyFileRenamePolicy;
import kh.home.model.service.TripService;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.TripModify;
import kh.trip.model.vo.TripRegist;

@WebServlet("/modifiedTrip.trip")
public class ModifyTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyTripServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// -- 첨부 파일 업로드용 로직 작성부 -- //

		// 업로드할 파일의 용량을 제한(10MB)
		int maxSize = 1024 * 1024 * 10;

		// enctype 으로 전달이 되었는지 확인
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "form-data 타입으로 전송해야 합니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

		// 웹 루트 경로 확보
		String root = request.getServletContext().getRealPath("/");

		// 업로드 되는 파일이 저장 될 폴더 생성 및 경로 설정
		// web/resources/bUploadFiles 경로가 됨
		String savePath = root + "resources/host_images";

		// request --> MultipartRequest
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// --------------------------------------------------------------------------------
		// //
		TripRegistService tService = new TripRegistService();

		String tno = multiRequest.getParameter("tripNumber");
		String title = multiRequest.getParameter("title");
		int price = Integer.parseInt(multiRequest.getParameter("price"));
		String language = multiRequest.getParameter("language");
		String category = multiRequest.getParameter("category");
		int people = Integer.parseInt(multiRequest.getParameter("people"));
		String introduce = multiRequest.getParameter("introduce");
		String startTime = multiRequest.getParameter("startTime");
		String endTime = multiRequest.getParameter("endTime");
		String startReservation = multiRequest.getParameter("startReservation");
		String endReservation = multiRequest.getParameter("endReservation");
		String address = multiRequest.getParameter("zip") + "| " + request.getParameter("addr") + "| "
				+ request.getParameter("addr_detail");
		String fileName1 = multiRequest.getFilesystemName("pic1");
		String fileName2 = multiRequest.getFilesystemName("pic2");
		String fileName3 = multiRequest.getFilesystemName("pic3");

		// System.out.println("title : " + title);
		// System.out.println("price : " + price);
		// System.out.println("lang : " + language);
		// System.out.println("cate : " + category);
		// System.out.println("people : " + people);
		// System.out.println("intro : " + introduce);
		// System.out.println("zip : " + zip);
		// System.out.println("addr : " + addr);
		// System.out.println("addr-d : " + addr_detail);
		// System.out.println("st : " + startTime);
		// System.out.println("et : " + endTime);
		// System.out.println("sr : " + startReservation);
		// System.out.println("er : " + endReservation);
		//
		TripRegist tregist = tService.selectOne(tno);

		tregist.setTno(tno);
		tregist.setTrip_name(title);
		tregist.setTrip_price(price);
		tregist.setTrip_language(language);
		tregist.setTrip_category(category);
		tregist.setTrip_maxPeople(people);
		tregist.setTrip_introduce(introduce);
		tregist.setTrip_address(address);
		tregist.setTrip_startTime(startTime);
		tregist.setTrip_endTime(endTime);
		tregist.setTrip_stratReservation(startReservation);
		tregist.setTrip_endReservation(endReservation);

		if (fileName1 != null && fileName2 != null && fileName3 != null) {
			File originFile1 = new File(savePath + "/" + tregist.getPic1());

			originFile1.delete();

			File originFile2 = new File(savePath + "/" + tregist.getPic2());

			originFile2.delete();

			File originFile3 = new File(savePath + "/" + tregist.getPic3());

			originFile3.delete();

			tregist.setPic1(fileName1);
			tregist.setPic2(fileName2);
			tregist.setPic3(fileName3);
		}

		

		int result = tService.updateTrip(tregist);

		String page = "";
		if (result > 0) {
			page = "views/regist/11trip_registed.jsp";
			request.setAttribute("trgist", new TripRegistService().selectOne(tno));
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정 실패!!");
		}
		request.getRequestDispatcher(page).forward(request, response);


//		if (fileList.size() > 0) {
//
//			for (int i = 0; i < fileList.size(); i++) {
//				String fileName = fileList.get(i);
//				switch (i) {
//				case 0:
//					tmodify.setPic1(fileName);
//					System.out.println("1 : " + fileName);
//					break;
//				case 1:
//					tmodify.setPic2(fileName);
//					System.out.println("2 : " + fileName);
//					break;
//				case 2:
//					tmodify.setPic3(fileName);
//					System.out.println("3 : " + fileName);
//					break;
//				}
//
//			}
//		}
//
//		request.setAttribute("tmodify", tmodify);
//
//	}

	request.getRequestDispatcher("/views/regist/11trip_registed.jsp").forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
