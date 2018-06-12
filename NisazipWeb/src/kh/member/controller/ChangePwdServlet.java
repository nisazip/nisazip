package kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.service.MemberService;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/changePwd.me")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prepwd = request.getParameter("presentPwd"); //m.get
		System.out.println("1"+prepwd);
		String pwd1 =request.getParameter("prePwd"); //입력값
		System.out.println("2"+pwd1);
		
		String pwd =request.getParameter("pwd");
		String id = request.getParameter("cgPwdid");
		
		MemberService ms = new MemberService();
			
		HttpSession session = request.getSession(false);

		if(!prepwd.equals(pwd1)){
			session.setAttribute("messageContent", "기존 비밀번호가 틀렸습니다.");
			session.setAttribute("messageType", "오류메세지");
			response.sendRedirect(request.getHeader("referer")); 
		}else{
			if((ms.resetPwd(id, pwd))>0){
				session.setAttribute("messageContent", "성공적으로 회원정보가 변경되었습니다.");
				session.setAttribute("messageType", "성공");
				response.sendRedirect(request.getHeader("referer")); 
			}else{
				session.setAttribute("messageContent", "입력값을 다시 확인하세요");
				session.setAttribute("messageType", "오류메세지");
				response.sendRedirect(request.getHeader("referer")); 
			}
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
