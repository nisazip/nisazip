package kh.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/Update.me")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String name = request.getParameter("updateName");
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		char gender ='?';
		if(request.getParameter("gender") == null){
			gender = '무';
		}else { gender = request.getParameter("gender").toUpperCase().charAt(0);}
		
		
				
		String bDate =request.getParameter("upBirthday_year")+"-"
				+request.getParameter("upBirthday_month")+"-"
				+request.getParameter("upBirthday_day");
		
		// Service 객체를 통한 회원 정보 갱신
		MemberService ms = new MemberService();
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		m.setUser_name(name);
		m.setGender(gender);
		m.setPhone(phone);
		m.setBirthdate(bDate);
		System.out.println("bDate"+bDate);
		
		System.out.println("회원 기존 정보 : "+session.getAttribute("member"));
		
		System.out.println("회원 정보 수정 시 전달 받은 값 : "+m);
		
		if(ms.updateMember(m) > 0) {
			System.out.println("회원 정보 수정 완료! : "+m);
			
			
			//session.invalidate();

			
			session.setAttribute("member", m);

			response.sendRedirect("views/member/memberUpdate.jsp");
			
		} else {
			session.setAttribute("messageContent", "입력값이 없거나 유효하지 않습니다.");
			session.setAttribute("messageType", "오류메시지");
			response.sendRedirect("views/member/memberUpdate.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
