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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userIDtoBin");
		
		System.out.println(id);
		
		ArrayList<HashMap<String,Object>> tCompleteList = null;				
		BinService bs = new BinService();		
		tCompleteList = bs.myTripsListP(id);
		
		String page = "";
		if(tCompleteList != null) {
			page = "views/member/myBin.jsp";
			request.setAttribute("tCompleteList", tCompleteList);
		} else {
			HttpSession session = request.getSession(false);

			session.setAttribute("messageContent", "저장된 회원정보가 아닙니다.");
			session.setAttribute("messageType", "오류메세지");
			response.sendRedirect(request.getHeader("referer")); 
		}
		
		request.getRequestDispatcher(page)
		.forward(request, response);
		     
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
