package kh.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.message.model.service.MessageService;
import kh.message.model.vo.Message;

/**
 * Servlet implementation class MessageSendServlet
 */
@WebServlet("/messageSend.m")
public class MessageSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	Member m = (Member) request.getSession().getAttribute("member");
		if(m==null){			
			request.setAttribute("msg", "로그인 필요!");			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		String m_writer =m.getUser_id(); 
	*/	
		
		String m_writer = request.getParameter("m_writer");
		String m_receiver = request.getParameter("m_receiver");
		String hosting_id = request.getParameter("hosting_id");

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int guest_num = Integer.parseInt(request.getParameter("guest_num"));

		String m_content = request.getParameter("m_content");

		
		int mResult = 0;
	
		
		Message message = new Message( m_writer, m_receiver, hosting_id, checkin, checkout, guest_num, m_content);
		
		mResult = new MessageService().messageSend(message);
	
		response.getWriter().print(mResult);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
