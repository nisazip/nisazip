package kh.room.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.room.model.service.rService;
import kh.room.model.vo.Room;

/**
 * Servlet implementation class RlistServlet
 */
@WebServlet("/roomselectList.no")
public class RlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RlistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Room> list = null;
		
		list = new rService().selectList();
		
		System.out.println("list: "+list);
		
		String page = "";
		if(list != null){
			page = "views/room/Roomlist.jsp";
			request.setAttribute("list", list);
		} else {
			System.out.println("fail");
			page = "views/common/errorPage.jsp";
		}
		RequestDispatcher views = request.getRequestDispatcher(page);
		views.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
