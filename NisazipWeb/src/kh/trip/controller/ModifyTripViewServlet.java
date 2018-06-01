package kh.trip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.trip.model.service.TripRegistService;
import kh.trip.model.vo.TripRegist;

@WebServlet("/modifyTrip.trip")
public class ModifyTripViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ModifyTripViewServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String tno = request.getParameter("tripNumber");
		
		System.out.println("시퀀스 번호 : " + tno);
		
		HttpSession session = request.getSession();
		
		TripRegist tregist = new TripRegistService().selectOne(tno);
		
		System.out.println("tregist : " + tregist);
		
		String page ="";
		
		if( tregist != null){
			page = "views/regist/13trip_modify.jsp";
			session.setAttribute("tregist", tregist);
		} else {
			page="views/common/erroPage.jsp";
			session.setAttribute("msg", "수정 페이지 접근 실패!!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
