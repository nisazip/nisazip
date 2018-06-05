package kh.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/msValue.ms")
public class messageValueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public messageValueServlet() { 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String r1 = request.getParameter("r1");
		String r2 = request.getParameter("r2");
		
		System.out.println("r1:"+r1 +", r2:"+r2);
		
		
		request.setAttribute("r1", r1);
		request.setAttribute("r2", r2);
		request.getRequestDispatcher("views/message/messageDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
