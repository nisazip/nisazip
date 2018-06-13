package kh.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;

@WebServlet("/cancelRoom.mg")
public class CancelRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CancelRoomServlet() { }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int roomReservNo = Integer.parseInt(request.getParameter("roomReservNo"));
		
		int result =0;
		String page="";
		
		result = new ManagerService().cancelRoom(roomReservNo);
		
		if(result>0){
			page="/reservRoomList.mg";
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
