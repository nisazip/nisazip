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



@WebServlet("/memberList.mg")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListServlet() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MemberList> list = new ManagerService().mList();
		String page="";
		
		if(list!=null){
			request.setAttribute("mList",list);
			page="views/manager/user_mng.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("에러발생");
			page=request.getContextPath()+"/common/errorPage.jsp";
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
