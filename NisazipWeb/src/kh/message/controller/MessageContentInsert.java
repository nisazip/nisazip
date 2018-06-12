package kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kh.message.model.service.MessageContentService;
import kh.message.model.vo.MessageContent;

/**
 * Servlet implementation class MessageContentInsert
 */
@WebServlet("/msInsert.ms")
public class MessageContentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MessageContentInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ms_content =request.getParameter("ms_content");
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		String ms_writer = request.getParameter("ms_writer");
		String ms_receiver = request.getParameter("ms_receiver");
		
	
		
		MessageContent ms = new MessageContent();
		ms.setM_no(m_no);
		ms.setMs_content(ms_content);
		ms.setMs_receiver(ms_receiver);
		ms.setMs_writer(ms_writer);
		
		// 메시지 내용 저장
		int result = new  MessageContentService().msInsert(ms);
		
		ArrayList<MessageContent> mclist =new MessageContentService().msList(m_no); 
		
		
		JSONObject msc = null;
		JSONArray msList =new JSONArray();
		
		for(MessageContent mc : mclist){
			msc= new JSONObject();
			
			msc.put("ms_no", mc.getMs_no());
			msc.put("m_no", mc.getM_no());
			msc.put("ms_writer", mc.getMs_writer());
			msc.put("ms_receiver", mc.getMs_receiver());
			msc.put("ms_content", mc.getMs_content());
			msc.put("ms_date_time", mc.getMs_date_time());
			
			msList.add(msc);
			
		}
		
		response.setContentType("application/json; charset=UTF-8");	
		response.getWriter().println(msList.toJSONString());

		/*
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(mclist, response.getWriter());
		
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
