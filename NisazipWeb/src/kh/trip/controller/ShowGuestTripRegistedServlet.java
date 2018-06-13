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
import kh.trip.model.vo.Attachment;
import kh.trip.model.vo.Trip;

@WebServlet("/registedTrip_guest.trip")
public class ShowGuestTripRegistedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowGuestTripRegistedServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); Member m =
		 * (Member)session.getAttribute("member"); String userId =
		 * m.getUser_id();
		 * 
		 * 
		 * 
		 * 
		 * System.out.println("ShowGuest Trip tripNum : " + tripNumber);
		 * 
		 */
		String tripNumber = request.getParameter("TripNum");

		System.out.println("게스트 뷰 서블릿 tripNumber : "+tripNumber);
		
		// userId를 받아서 그 user가 가지고 있는 정보를 DB에서 불러오는 서블릿
		request.getAttribute("tregist");
		request.getAttribute("hp");
		request.getAttribute("picList");

		Trip t = new TripRegistService().getTripGuest(tripNumber);
		ArrayList<Attachment> list = new TripRegistService().getPictureGuest(tripNumber);

		System.out.println("게스트 서블릿 : " + list);

		System.out.println("list.get(0) : " + list.get(0));
		System.out.println("list.get(1) : " + list.get(1));
		System.out.println("list.get(2) : " + list.get(2));

		System.out.println("list.get(0).getChange_name() : " + list.get(0).getChange_name());

		System.out.println("Change_name : " + list);

		String page = "";
		if (t != null && list != null) {
			page = "views/regist/12trip_registed(guest).jsp";
			request.setAttribute("tregist", t);
			request.setAttribute("picList", list);

		} else {
			page = "views/common/errorPage.jsp";
			System.out.println("업데이트 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
