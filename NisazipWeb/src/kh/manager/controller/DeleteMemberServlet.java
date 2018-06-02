package kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/deleteMember.mg")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteMemberServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = Integer.parseInt(request.getParameter("userNo"));
		
		int result = new ManagerService().deleteMember(mNo);
		
		String page="";
		
		if(result>0){
			page="/memberList.mg";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("회원 삭제 실패");
			page="views/common/errorPage";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
