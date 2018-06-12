package kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.message.model.service.MessageContentService;
import kh.message.model.service.MessageService;
import kh.message.model.vo.Message;
import kh.message.model.vo.MessageContent;

@WebServlet("/messageSelect.m")
public class MessageSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessageSelectServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		
		Message message = new MessageService().messageSelect(m_no);	
		int day = new Message().dateCalculation(message.getCheckin(), message.getCheckout());
		int result = new MessageService().readCheck(m_no);
		ArrayList<MessageContent> mclist =new MessageContentService().msList(m_no);
		HashMap<String, String > hostInfo = new MessageService().hostInfo(m_no,message.getHosting_id());		
		
		String page ="";
		if(message!=null){
			page ="views/message/messageDetail.jsp";
			request.setAttribute("message", message);
			request.setAttribute("mclist", mclist);
			request.setAttribute("day", day);
			request.setAttribute("hostInfo", hostInfo);
		}else{
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg","메시지 상세보기 실패");
		}
	
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
