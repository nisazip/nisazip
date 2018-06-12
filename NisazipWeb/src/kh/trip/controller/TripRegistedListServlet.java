package kh.trip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.vo.Member;
import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.Trip;

@WebServlet("/tripSelectList.trip")
public class TripRegistedListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TripRegistedListServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		Member m = (Member)session.getAttribute("member");
		
		ArrayList<Trip> list = null;

		list = new TripRegistService().selectList(m);

		System.out.println("RegistedList: " + list);

		String page = "";
		if (list != null) {
			page = "/views/regist/19TripRegistedList.jsp";
			request.setAttribute("registedList", list);
		} else {
			System.out.println("fail");
			page = "views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
