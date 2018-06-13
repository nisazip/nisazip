package kh.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.review.model.service.ReviewService;
import kh.review.model.vo.Review;

/**
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/reviewInsert.re")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String user_id =request.getParameter("userId");
		String hosting_id =request.getParameter("hosting_id_r");
		String re_content = request.getParameter("re_content");
		float re_score =Float.parseFloat( request.getParameter("re_score"));
		
		int result = 0;
		int check =0;
		
		System.out.println("리뷰추가 확인---------------------------");
		System.out.println("userId : " + user_id);
		System.out.println("hosting_id : " + hosting_id);
		
		check = new ReviewService().checkInfo(hosting_id,user_id); // 
		System.out.println("숙소이용 체크 값 : "+ check);
		
		if(check==1) { 
			Review re = new Review();
			re.setHosting_id(hosting_id);
			re.setRe_content(re_content);
			re.setUser_id(user_id);
			re.setRe_score(re_score);
			
			result =new ReviewService().reviewInsert(re);
			
		}else{
			check=-1;
		}
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
