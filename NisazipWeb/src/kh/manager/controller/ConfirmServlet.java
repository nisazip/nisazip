package kh.manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kh.manager.model.service.ManagerService;


@WebServlet("/confirm.mg")
public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ConfirmServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		
		int result = new ManagerService().confirm(userId);
		
		String msg = "";
		
		if(result >0){
			System.out.println("맴버 인증 성공");
			msg="맴버 인증이 완료되었습니다.";
		}else{
			System.out.println("맴버 인증 실패");
			msg="맴버 인증이 실패하였습니다.";
		}
		
		response.setContentType("application/json; charset=UTF-8");
	      new Gson().toJson(msg, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
