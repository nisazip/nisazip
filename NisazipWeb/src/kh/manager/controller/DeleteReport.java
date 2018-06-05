package kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/deleteReport.mg")
public class DeleteReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteReport() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reNo = Integer.parseInt(request.getParameter("reNo"));
		
		int result = new ManagerService().deleteReport(reNo);
		
		String page="";
		
		if(result>0){
			page="/reportList.mg";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("신고 삭제 실패");
			page="views/common/errorPage";
			request.getRequestDispatcher(page).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
