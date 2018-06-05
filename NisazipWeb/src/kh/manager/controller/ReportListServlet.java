package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.PageInfo;
import kh.report.model.vo.Report;
import kh.room.model.vo.Room;

@WebServlet("/reportList.mg")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReportListServlet() {  }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		System.out.println(condition);
		System.out.println(keyword);
		
		ArrayList<Report> list =null;
		ManagerService mService = null;
		String page="";
		
		/*페이징 처리 코드 부분*/
		
		int startPage;		//한번에 표시될 리스트 시작 페이지
		int endPage;		//한번에 표시될 리스트 마지막 페이지
		int maxPage;		//전체 페이지의 마지막 페이지
		int currentPage;	//현재 페이지
		int limit;			//한 페이지당 게시글 수
		
		// 게시판은 1페이지 부터 시작한다.
		currentPage =1;
		
		// 한 페이지에 보여질 게시글 수
		limit =10;
		
		// 만약에 전달받는 페이지가 있을 경우
		// 즉, 현재 페이지 정보를 받을 경우
		// currentPage의 값을 수정한다.
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 전체 게시글의 수 /*.rList();*/
		int listCount = 0;
		
		mService = new ManagerService();

		if(condition==null || keyword==null){
			condition="선택하기";
			keyword="";
		}
		
		if(condition.equals("reWriter")) {
			listCount = mService.searchReWriterCount(keyword);
		}else if(condition.equals("reReciver")) {
			listCount = mService.searchReReciverCount(keyword);
		}else {
			System.out.println("condition :" +condition);
			listCount = mService.getReportListCount();
		}

		System.out.println("총 신고 수 : "+listCount);
		if(listCount!=0){
		maxPage = (int)((double)listCount / limit + 0.9);

		startPage =(((int)((double)currentPage / limit + 0.9))-1)*limit +1;
		
		// 한 화면에 표시할 마지막 페이지 번호
		endPage = startPage + limit -1;
		
		// 10페이지 까지 내용이 안 찰 경우
		if(maxPage <endPage) {
			endPage=maxPage;
		}
		
		// 페이지 관련 변수 전달용 VO 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, startPage, endPage, maxPage);
		
		/*페이징 처리 코드 부분*/
		list = new ArrayList<Report>();
		//페이지 처리를 수행할 경우
		if(condition.equals("reWriter")) {
			list = mService.searchReWriter(currentPage, limit, keyword);
		}else if(condition.equals("reReciver")) {
			list = mService.searchReReciver(currentPage, limit, keyword);
		}else {
			list = mService.reList(currentPage, limit);
		}

		if(list!=null){
			page="views/manager/report_mng.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("reList",list);
			request.setAttribute("keyword",keyword);
			request.setAttribute("condi", condition);
		}else{
			System.out.println("에러발생");
			page=request.getContextPath()+"/common/errorPage.jsp";
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		}else{
			page="views/manager/room_mng.jsp";
			request.setAttribute("reList",null);
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
