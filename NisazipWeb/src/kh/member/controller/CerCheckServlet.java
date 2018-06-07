package kh.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import kh.common.MyFileRenamePolicy;
import kh.member.model.service.MemberService;
import kh.member.model.vo.UserPic;



/**
 * Servlet implementation class SInsertServlet
 */
@WebServlet("/presentCer.pic")
public class CerCheckServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CerCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	   	String id = request.getParameter("id");
	    UserPic pic = new UserPic();
		pic.setUser_id(id);
		
        pic = new MemberService().findUserCer(pic);
        
        if(pic != null){
        	System.out.println("pic.getChange_name():"+pic.getChange_name());
            String root = "semi\resources\thumbnail_uploadFiles\\";
    		response.getWriter().print(pic.getChange_name());
        }else{
        	response.getWriter().print("certification-card.jpg");
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