package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;
import kh.room.model.vo.Room;

@WebServlet("/roomList.mg")
public class RoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Room> list = new ManagerService().rList();
		String page="";
		
		if(list != null){
			page="views/manager/room_mng.jsp";
			request.setAttribute("rList", list);
			request.getRequestDispatcher(page).forward(request, response);
		}else{
			page="views/Common/errorPage.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}

		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
