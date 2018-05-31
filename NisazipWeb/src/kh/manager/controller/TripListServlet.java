package kh.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.manager.model.service.ManagerService;
import kh.trip.model.vo.Trip;

@WebServlet(name = "TListServlet", urlPatterns = { "/tripList.mg" })
public class TripListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TripListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Trip> list = new ManagerService().tList();
		String page="";
		
		if(list != null){
			page="views/manager/trip_mng.jsp";
			request.setAttribute("tList", list);
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










