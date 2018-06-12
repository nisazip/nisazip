package kh.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.service.BinService;

/**
 * Servlet implementation class MyBinServlet
 */
@WebServlet("/storage.do")
public class MyBinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyBinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);

		ArrayList<HashMap<String, Object>> tCompleteList = null;
		ArrayList<HashMap<String, Object>> tGoingtoList = null;
		ArrayList<HashMap<String, Object>> rCompleteList = null;
		ArrayList<HashMap<String, Object>> rGoingtoList = null;

		BinService bs = new BinService();
		tCompleteList = bs.myTripsListP(id); // 과거트립
		tGoingtoList = bs.myTripsListW(id); // 미래트립
		rCompleteList = bs.myRoomsListP(id); // 과거 트립
		rGoingtoList = bs.myRoomsListW(id); // 미래 트립

		System.out.println(tCompleteList);
		System.out.println(tGoingtoList);
		System.out.println(rCompleteList);
		System.out.println(rCompleteList);

		HttpSession session = request.getSession(false);

		String page = "";
		if (tCompleteList != null) {
			page = "views/member/myBin.jsp";
			session.setAttribute("tCompleteList", tCompleteList);
			session.setAttribute("tGoingtoList", tGoingtoList);
			session.setAttribute("rCompleteList", rCompleteList);
			session.setAttribute("rGoingtoList", rGoingtoList);
		} else {

			session.setAttribute("messageContent", "페이지를 올바르게 불러올 수 없습니다.");
			session.setAttribute("messageType", "오류메세지");
			response.sendRedirect(request.getHeader("referer"));
		}

		request.getRequestDispatcher(page).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
