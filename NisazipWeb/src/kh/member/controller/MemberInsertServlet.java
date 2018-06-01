package kh.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.util.Arrays;

import kh.member.model.service.MemberService;
import kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/join.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MemberInsertServlet() { }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String bDate =request.getParameter("birthday_year")+"-"
				+request.getParameter("birthday_month")+"-"
				+request.getParameter("birthday_day");
		
		

			
		MemberService ms = new MemberService();
			
		Member m = new Member();
		m.setUser_id(id);
		m.setPassword(pwd);
		m.setEmail(email);
		m.setUser_name(name);
		m.setBirthdate(bDate);
		System.out.println("회원 가입 시 전달 받은 값 : "+m);

		
		
		// Service 객체를 통한 로그인 정보 확인
	
		
		
		if(ms.insertMember(m) > 0) {
			System.out.println("회원 가입 완료! : "+m);
			request.setAttribute("member", m);
			response.sendRedirect("index.jsp");
			
		} else {
			request.setAttribute("msg", "회원 가입 중 에러가 발생하였습니다.");
			request.getRequestDispatcher("views/errorPage.jsp").forward(request, response);
		}
		

		
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
