package kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/cancelTrip.mg")
public class CancelTripServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelTripServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tripReservNo = request.getParameter("tripReservNo");
		
		int result =0;
		String page="";
		
		result = new ManagerService().cancelTrip(tripReservNo);
		
		if(result>0){
			page="/reservTripList.mg";
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			System.out.println("예약 취소 실패");
			page="views/common/errorPage";
			request.getRequestDispatcher(page).forward(request, response);
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
