package kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/deleteTrip.mg")
public class DeleteTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteTripServlet() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tno = request.getParameter("tripNo");
		
		int result = new ManagerService().deleteTrip(tno);
		
		String page="";
		
		if(result >0){
			page="/tripList.mg";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("트립 삭제 실패");
			page="views/common/errorPage";
			request.getRequestDispatcher(page).forward(request, response);
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
