package kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.member.model.vo.Member;
import kh.message.model.service.MessageService;

/**
 * Servlet implementation class MessageListServlet
 */
@WebServlet("/messageList.m")
public class MessageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public MessageListServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member) request.getSession().getAttribute("member");
		if(m==null){			
			request.setAttribute("msg", "로그인 필요!");			
			System.out.println("messageListServlet");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		String user_id =m.getUser_id(); 
		
		
		ArrayList<HashMap<String, Object>> mlist = new MessageService().writeMList(user_id);
		ArrayList<HashMap<String, Object>> rlist = new MessageService().receiveMList(user_id);  
		
	
	
		String page="";
		if(mlist!= null && rlist!=null){
			page="views/message/messageList.jsp";
			request.setAttribute("mlist", mlist);
			request.setAttribute("rlist", rlist);

		}else{
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "메시지 리스트 보기 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
