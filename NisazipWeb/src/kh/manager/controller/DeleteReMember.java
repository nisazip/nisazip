package kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/deleteReMember.mg")
public class DeleteReMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteReMember() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String UserId = request.getParameter("reReceiver");
		int result =0;
		String page="";
		
		//해당 회원의 신고 삭제 부터
		result += new ManagerService().deleteReReport(UserId);
		
		//해당 회원의  삭제 
		result += new ManagerService().deleteReMember(UserId);

		if(result>0){
			page="/reportList.mg";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("회원 탈퇴 실패");
			page="views/common/errorPage";
			request.getRequestDispatcher(page).forward(request, response);
		}
				
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
