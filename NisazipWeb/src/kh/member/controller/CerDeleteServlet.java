package kh.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.member.model.service.MemberService;

/**
 * Servlet implementation class CerDeleteServlet
 */
@WebServlet("/Auth.del")
public class CerDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("cerDelId");
		int no = Integer.parseInt(request.getParameter("cerDelNo"));
	   	System.out.println("cerDelId:"+id);
	   	int result = new MemberService().deleteCertification(id);
	   	
        HttpSession session = request.getSession(false);

       
     
     if (result > 0) {
    	 	new MemberService().setCerN(no);
    	 	session.setAttribute("messageContent", " 사진과 인증 정보가 <br>성공적으로 제거되었습니다.");
			session.setAttribute("messageType", "성공");
			response.sendRedirect(request.getHeader("referer")); 
        
     } else {
        // 실패시 저장된 사진 삭제
       
    	 session.setAttribute("messageContent", "기본 이미지를 삭제할 수는 없습니다..");
			session.setAttribute("messageType", "오류메세지");
			response.sendRedirect(request.getHeader("referer")); 
   		

      
     }
  }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}	

}
