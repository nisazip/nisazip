package kh.room.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.room.model.service.rService;
import kh.room.model.vo.Attachment;
import kh.room.model.vo.Room;

/**
 * Servlet implementation class RViewGusetServlet
 */
@WebServlet("/ViewRoom.no")
public class RViewGusetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RViewGusetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		HashMap<String,Object> map = new rService().selectOne(num);
		
		String page = "";
		if(map != null){
			page = "views/room/RoomInfo(guest).jsp";
			request.setAttribute("room", ((Room)map.get("room")));
			request.setAttribute("fileList", ((ArrayList<Attachment>)map.get("fileList")));
		} else {
			System.out.println("접근 실패");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
