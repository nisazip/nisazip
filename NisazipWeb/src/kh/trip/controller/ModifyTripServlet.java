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
import kh.trip.model.vo.Trip;

@WebServlet("/modifiedTrip.trip")
public class ModifyTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyTripServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		System.out.println("-------------------- 수정 페이지 서블릿 실행 -------------------");
		
		Trip tr = new Trip();
		Trip origin_tr = new TripRegistService().getTrip("user01");
		ArrayList<Attachment> origin_list =  new TripRegistService().getPicture("user01");
		
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 1024 * 1024 * 10;

			String root = request.getSession().getServletContext().getRealPath("/resources");
			System.out.println(root);

			String savePath = root + "/trip_images/";
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String reTitle = multiRequest.getParameter("reTitle");
			int rePrice = Integer.parseInt(multiRequest.getParameter("rePrice"));
			String reLanguage = multiRequest.getParameter("reLanguage");
			int rePeople = Integer.parseInt(multiRequest.getParameter("rePeople"));
			String reCategory = multiRequest.getParameter("reCategory");
			String reIntroduce = multiRequest.getParameter("reIntroduce");
			String reStartTime = multiRequest.getParameter("reStartTime");
			String reEndTime = multiRequest.getParameter("reEndTime");
			String reStartReservation = multiRequest.getParameter("reStartReservation");
			String reEndReservation = multiRequest.getParameter("reEndReservation");
			String reAddress = multiRequest.getParameter("reZip") + "| " + multiRequest.getParameter("reAddr") + "| "
					+ multiRequest.getParameter("reAddr_detail");
			
			String fileName1 = multiRequest.getFilesystemName("thumbnailImg1");
			String fileName2 = multiRequest.getFilesystemName("thumbnailImg2");
			String fileName3 = multiRequest.getFilesystemName("thumbnailImg3");
			
			System.out.println("file 1 : "+fileName1);
			System.out.println("file 2 : "+fileName2);
			System.out.println("file 3 : "+fileName3);
	
			ArrayList<String> saveFiles = new ArrayList<String>();

			ArrayList<String> originFiles = new ArrayList<String>();

			ArrayList<Attachment> fileList = new ArrayList<Attachment>();

			fileCheck(0, fileName1, origin_list, fileList, multiRequest);
			fileCheck(1, fileName2, origin_list, fileList, multiRequest);
			fileCheck(2, fileName3, origin_list, fileList, multiRequest);
			
			Attachment titleImg = fileList.get(0);
			Attachment detailImg1 = fileList.get(1);
			Attachment detailImg2 = fileList.get(2);
			
			System.out.println("titleImg : " + titleImg);
			System.out.println("detailImg1 : " + detailImg1);
			System.out.println("detailImg2 : " + detailImg2);

			TripRegistService ts = new TripRegistService();
			
			origin_tr.setT_name(reTitle);
			origin_tr.setT_addr(reAddress);
			origin_tr.setT_type(reCategory);
			origin_tr.setT_detail(reIntroduce);
			origin_tr.setLanguage(reLanguage);
			origin_tr.setT_max_num(rePeople);
			origin_tr.setPrice(rePrice);
			origin_tr.setT_start_time(reStartTime);
			origin_tr.setT_end_time(reEndTime);
			origin_tr.setT_start_date(myDateRollback(reStartReservation));
			origin_tr.setT_end_date(myDateRollback(reEndReservation));
			
			System.out.println("수정된 TripRegist : " + origin_tr);
			System.out.println("수정된 fileList : " + fileList);
			
			request.setAttribute("tregist", tr);
			request.setAttribute("fileList", fileList);

			System.out.println("Servlet단 origin_tr : "+ origin_tr);

			int result1 = ts.updateTrip(origin_tr);
			int result2 = ts.updatePicture(fileList);

			String page = "";
			if (result1 > 0 && result2 > 0) {
				page = "/registedTrip.trip";
//				request.setAttribute("list", ts.selectTripRegist());
			} else {
				System.out.println("수정 실패!");
			}
			request.getRequestDispatcher(page).forward(request, response);
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public String myDateRollback(String str){
		// 이거 테스트 해봐야 할 것 같네요, 나중에 ㅎㅎ
		String[] dateReturn = str.split("[가-힣]");
		
		return dateReturn[0]+"/"+dateReturn[1]+"/"+dateReturn[2];
	}
	
	 public void fileCheck(int idx, String fileName, ArrayList<Attachment> origin_list, ArrayList<Attachment> fileList, MultipartRequest multiRequest){
		 Attachment at = null;
		 
		 if(fileName == null){
			fileList.add(origin_list.get(idx));
		} else {
			// 들어온 값이 있다면 ( 즉 사진을 수정했다면 )
			// 새로운 사진의 정보를 기록합니다.
			
			at = origin_list.get(idx); // 원본에서 사진 파일 부분만 수정합니다.
			
			// 사진 정보를 변경하기 전에 기존의 사진을 삭제합니다.
			new File(origin_list.get(idx).getFile_path()+"/"+origin_list.get(idx).getChange_name()).delete();
			// idx 가 0부터 시작하기 때문에 + 1 이 필요합니다.
			at.setOrigin_name(multiRequest.getOriginalFileName("thumbnailImg"+(idx+1)));
			at.setChange_name(fileName);
			System.out.println("사진 "+idx+" : "+at.getOrigin_name()+" / "+ at.getChange_name());
			
			fileList.add(at);
		}
	 }
}
