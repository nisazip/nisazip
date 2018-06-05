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
import kh.room.model.vo.Room;
import kh.trip.model.vo.Trip;

@WebServlet(name = "TListServlet", urlPatterns = { "/tripList.mg" })
public class TripListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TripListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		ArrayList<Trip> list = null;
		ManagerService mService = new ManagerService();
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
		
		if(condition==null || keyword==null){
			condition="선택하기";
			keyword="";
		}
		
		// 전체 게시글의 수
		int listCount = 0;
		
		if(condition.equals("tName")) {
			listCount = mService.searchTNameCount(keyword);
		}else if(condition.equals("tHostId")) {
			listCount = mService.searchTHostIdCount(keyword);
		}else if(condition.equals("tArea")) {
			listCount = mService.searchTAreaCount(keyword);
		}else {
			listCount = mService.getTripListCount();
		}
		
		System.out.println("총 회원 수 : "+listCount);
		if(listCount!=0){
		// 총 게시글 수에 대한 페이지 계산
		// EX> 목록의 수가 123 개라면 페이지 수는 13페이지가 된다.
		//     짜투리 게시글도 하나의 페이지로 취급해야 한다.
		// 10/1 --> 0.9를 더하여 하나의 페이지로 만든다.
		maxPage = (int)((double)listCount / limit + 0.9);
		
		// 현재 화면에 표시할 페이지 개수
		
		// 첫 페이지의 번호
		// ex) 한 화면에 10개의 페이지를 표시하는 경우 
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
		
		//페이지 처리를 안할 경우
		//list = bService.selectList(); 
		list = new ArrayList<Trip>();
		
		//페이지 처리를 수행할 경우
		
		
		if(condition.equals("tName")) {
			list = mService.searchTName(currentPage, limit, keyword);
		}else if(condition.equals("tHostId")) {
			list = mService.searchTHostId(currentPage, limit, keyword);
		}else if(condition.equals("tArea")) {
			list = mService.searchTArea(currentPage, limit, keyword);
		}else {
			list = mService.tList(currentPage, limit);
		}
		

		if(list!=null){
			page="views/manager/trip_mng.jsp";
			request.setAttribute("pi", pi);
			request.setAttribute("tList",list);
			request.setAttribute("keyword",keyword);
			request.setAttribute("condi", condition);
		}else{
			System.out.println("에러발생");
			page=request.getContextPath()+"/common/errorPage.jsp";
			
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		}else{
			page="views/manager/trip_mng.jsp";
			request.setAttribute("tList",null);
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

/*
CREATE TABLE MEMBER(
        USER_NO NUMBER PRIMARY KEY,                            -- 회원번호
        USER_ID VARCHAR2(30) NOT NULL UNIQUE,                  -- 아이디
        PASSWORD VARCHAR2(100) NOT NULL,                       -- 비밀번호
        USER_NAME VARCHAR2(20) NOT NULL,                       -- 이름
        EMAIL VARCHAR2(30) UNIQUE,                             -- 이메일
        PHONE CHAR(13),                                        -- 연락처
        GENDER CHAR(1) CHECK( GENDER IN('F','M')),             -- 성별
        BIRTHDATE date,                                        -- 생년월일
        LIKEROOMS VARCHAR2(1000),                              -- 찜한 숙소 
        LIKETRIPS VARCHAR2(1000),                              -- 찜한 트립 
        R_HOSTING NUMBER DEFAULT 0,                            -- 숙소호스팅  
        T_HOSTING NUMBER DEFAULT 0,                            -- 트립 호스팅
        JOIN_DATE DATE DEFAULT SYSDATE                         -- 가입일
);
CREATE SEQUENCE SEQ_USER_NO;*/







