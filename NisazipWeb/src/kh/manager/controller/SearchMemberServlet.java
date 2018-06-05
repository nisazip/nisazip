package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;
import kh.manager.model.vo.MemberList;
import kh.manager.model.vo.PageInfo;

@WebServlet("/searchMember.mg")
public class SearchMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchMemberServlet() { 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		System.out.println(condition);
		System.out.println(keyword);
		
		ArrayList<MemberList> list = null;
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
		int listCount = 0;
		mService = new ManagerService();
		// 총 회원 수
		if(condition.equals("sId")) {
			listCount = mService.searchIdCount(keyword);
		}else if(condition.equals("sName")) {
			listCount = mService.searchNameCount(keyword);
		}else {
			listCount = mService.getMemeberListCount();
		}

		System.out.println("검색된 회원 수 : "+listCount);
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
			
			//페이지 처리를 수행할 경우
			if(condition.equals("sId")) {
				list = mService.searchId(currentPage, limit, keyword);
			}else if(condition.equals("sName")) {
				list = mService.searchName(currentPage, limit, keyword);
			}else {
				list = mService.selectMemberList(currentPage, limit);
			}
	
			if(list!=null){
				page="views/manager/user_mng.jsp";
				request.setAttribute("pi", pi);
				request.setAttribute("mList",list);
				request.setAttribute("keyword",keyword);
				request.setAttribute("condi", condition);
				
			}else{
				System.out.println("에러발생");
				page=request.getContextPath()+"/common/errorPage.jsp";
				
			}
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			page="views/manager/user_mng.jsp";
			request.setAttribute("mList",null);
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
