package kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.service.MemberService;
import kh.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("loginId");
		String pwd = request.getParameter("pwd");
				
		System.out.println(id);
		
		String at ="@";
		
		
		// Service 객체를 통한 로그인 정보 확인
		MemberService ms = new MemberService();
		Member m = new Member();
		
				
		System.out.println(id.contains(at));
		
		if(id.contains(at)){
			m.setEmail(id);
			m.setPassword(pwd);
			System.out.println("email login시 전달 받은 값:"+m);
			m = ms.selectMemberE(m);
			
		}else{
			m.setUser_id(id);
			m.setPassword(pwd);
			System.out.println(" id login시 전달 받은 값:"+m);
			m = ms.selectMemberI(m);
			}
		
		HttpSession session = request.getSession(false);
		if(m != null) {
			System.out.println("login 결과로 받은 값 : "+m);
			
			
			
			session.setAttribute("member", m);
			
			response.sendRedirect(request.getHeader("referer")); 
			
		} else {
			
			session.setAttribute("messageContent", "저장된 회원정보가 아닙니다.");
			session.setAttribute("messageType", "오류메세지");
			response.sendRedirect(request.getHeader("referer")); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
