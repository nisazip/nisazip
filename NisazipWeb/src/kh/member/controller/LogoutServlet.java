package kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.INSTANCEOF;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout.me")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() { }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		if(session != null){
			System.out.println("request.getHeader('referer'):"+request.getHeader("referer"));
			System.out.println("타입:"+request.getHeader("referer") instanceof String);

			if( request.getHeader("referer").equals("http://localhost:8088/semi/views/member/memberUpdate.jsp") ||request.getHeader("referer").equals("http://localhost:8088/semi/views/member/myBin.jsp")||request.getHeader("referer").equals("http://localhost:8088/semi/views/member/certification.jsp")){
				session.invalidate();
				response.sendRedirect("index.jsp"); 
				
			}else{
				session.invalidate();
				response.sendRedirect(request.getHeader("referer")); 
			}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
