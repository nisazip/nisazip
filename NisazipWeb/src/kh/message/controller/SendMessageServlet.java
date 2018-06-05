package kh.message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.message.model.vo.MSContent;

@WebServlet("/sendMsg.ms")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String sender = request.getParameter("sender");
		String reciver = request.getParameter("reciver");
		String content = request.getParameter("content");
		
		MSContent mcontent = new MSContent(mNo,sender,reciver,content);
		System.out.println("서블릿:"+mcontent);
		
		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(mcontent, response.getWriter());
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
