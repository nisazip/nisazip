package kh.member.controller;

import java.io.File;
import java.io.IOException;
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
 * Servlet implementation class certificationUploadServlet
 */
@WebServlet("/certification.pic")
public class certificationUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public certificationUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	      if (ServletFileUpload.isMultipartContent(request)) {
	         int maxSize = 1024 * 1024 * 10;
	        
	         String root = request.getSession().getServletContext().getRealPath("/resources");
	         System.out.println(root);
	         
	         String savePath = root + "/thumbnail_uploadFiles/";

	         MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
	               new MyFileRenamePolicy());

	        String saveFiles = null;       
	         //원본 파일 이름을 저장할 arrayList
	        String originFiles = null;
	 
	        String id = multiRequest.getParameter("uploadId");
	        System.out.println("user_id:"+ id);

	         Enumeration<String> files = multiRequest.getFileNames();

	         // 각 파일의 정보를 구해 온 후 DB에 저장할 목적의 데이터를 꺼내온다.
	      
	         String name = files.nextElement();

	         System.out.println("name : " + name);
	         // 저장된 경로에 저장된 파일 시스템 이름을 가져온다
	         saveFiles= multiRequest.getFilesystemName(name);
	         originFiles= multiRequest.getOriginalFileName(name);

	         System.out.println("filesystem name : " + multiRequest.getFilesystemName(name));
	         System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
	             
	         	
	           UserPic pic = new UserPic();
	           pic.setFile_path(savePath);
	           pic.setOrigin_name(originFiles);
	           pic.setChange_name(saveFiles);
	           pic.setUser_id(id); 
	        
	         int base = new MemberService().deleteCertification(id);  
	         int result=0;
	         if(saveFiles!= null){
	         result =  new MemberService().insertCertication(pic);
	         }  
	  
	         System.out.println("base:"+base);
	         System.out.println(result);
	         
	         
	         
	         HttpSession session = request.getSession(false);
	         if( saveFiles == null){
	        	 	session.setAttribute("messageContent", "입력갑이 없어 기본 이미지로 대체 합니다.");
	    			session.setAttribute("messageType", "오류메세지");
	    			response.sendRedirect(request.getHeader("referer")); 
	         }
	         
	         if (result > 0) {
	        	 
	        	 session.setAttribute("UserPic", pic);
	        	 response.sendRedirect(request.getHeader("referer"));
	            
	         } else {
	            // 실패시 저장된 사진 삭제
	           
	               // 파일시스템에 저장된 이름으로 파일 객체 생성함
	               File failedFile = new File(savePath + saveFiles);
	               System.out.println(failedFile);
	               // true false 리턴됨
	               // 실행하고 출력하면 당연히 false나오기 때문에 출력하면서 삭제
	               System.out.println(failedFile.delete());
	            
	            // 에러페이지로 메세지 전달
	       		

	          
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
