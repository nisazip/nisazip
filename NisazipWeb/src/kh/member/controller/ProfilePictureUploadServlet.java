package kh.member.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.member.model.service.MemberService;

/**
 * Servlet implementation class ProfilePictureUploadServlet
 */
@WebServlet("/profile.pic2")
public class ProfilePictureUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfilePictureUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// -- 파일 처리용 Multipart Files 로직 작성부 -- //
		
		// 업로드 할 파일의 최대 용량을 제한 
		// 10MB (1MB -> 1024KB / 1KB -> 1024Byte)
		int maxSize = 1024 * 1024 * 10;
		
		// 둧enctype="multipart/form-data" 로
		// 전송된 것이 맞는지 확인하는 작업
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("msg",
					"enctype을 지정하지 않았습니다.");
			request.getRequestDispatcher(
					"views/common/errorPage.jsp")
			.forward(request, response);
		}
		
		// 현재 웹 컨테이너의 기본 경로인
		// 웹 애플리케이션의 루트 경로 설정
		String root = request.getServletContext()
				.getRealPath("/");
		
		// 업로드 될 파일이 저장될 폴더 명과 경로를 연결
		// web/resources/bUploadFiles 폴더로 경로가 설정된다.
		
		String savePath = root+"resources/bUploadFiles";
		
		// 기존의 request 객체를 다양한 파일을 받기 위한
		// MultipartRequest 객체로 변환해야 한다.
		
		MultipartRequest mrequest = new MultipartRequest(
				request, // 기존의 request 객체
				savePath, // 서버 상에 업로드 될 경로 설정
				maxSize, // 파일의 최대 사이즈 설정
				"UTF-8",  // 저장에 사용할 인코딩 설정
				new DefaultFileRenamePolicy()
				   // 만약에 동일한 이름의 파일이 있다면
				   // 새로운 이름을 부여하여 기존의
				   // 파일명과 구분하는 정책을 설정한다.
				   // 기본값은 OOO.txt --> OOO1.txt
				);
		String id = mrequest.getParameter("user_id");
		File file = mrequest.getFile("userProfile");
		
		
		if(file != null){
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			if(ext.equals("jpg") || ext.equals("png") ||ext.equals("gif")){
				
			}
				
		}
		// -- 파일 처리용 Multipart Files 로직 작성부 -- //
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
