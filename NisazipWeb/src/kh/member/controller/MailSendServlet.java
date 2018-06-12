package kh.member.controller;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import kh.member.model.service.MemberService;
import kh.member.model.vo.Member;

 

/**

 * Servlet implementation class MailSendServlet

 */

@WebServlet("/send.mail")

public class MailSendServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

       

    /**
     * @see HttpServlet#HttpServlet()
     */

    public MailSendServlet() {
        super();

        // TODO Auto-generated constructor stub

    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String resetId = request.getParameter("resetId");
		System.out.println(resetId);
		String at ="@";
		MemberService ms = new MemberService();
		Member m = new Member();
		if(resetId.contains(at)){
			m.setEmail(resetId);
			m = ms.findbyEmail(m);
			System.out.println("이메일로 찾기");

		}else{
			m.setUser_id(resetId);
			m = ms.findbyId(m);
			System.out.println("아이디로 찾기");
			System.out.println(m);

			}
	     //String host = "http://localhost:8088/semi/";

	    

         HttpSession session =request.getSession(false);

	     if(m!= null){  
	    	 System.out.println("중복");
	    	 String mailId = "jejuyoulivein@gmail.com"; // 구글계정
		     String mailPassword = "jeju3youlivein"; // 구글계정 비밀번호 
		     String to = m.getEmail();
		     String id = m.getUser_id();
		     System.out.println(id);
		     String subject ="[네가 사는 제주] 비밀번호 재설정 링크입니다.";
		     String content =m.getUser_name()+"님 <br> 아래의 링크에 접속하여 비밀번호를 재설정하세요. <br><br> "+
		     "<a href='http://localhost:8088/semi/resetPwd.me?id="+id+"'>[네가사는제주] 비밀번호 재설정<a>";
	         Properties mailProps = new Properties();
	         mailProps.put("mail.smtp.user", mailId);
	         mailProps.put("mail.smtp.host", "smtp.googlemail.com");
	         mailProps.put("mail.smtp.starttls.enable", "true");
	         mailProps.put("mail.debug", "true");
	         mailProps.put("mail.smtp.port", "465");
	         mailProps.put("mail.smtp.socketFactory.port", "465");		
	         mailProps.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");		
	         mailProps.put("mail.smtp.socketFactory.fallback", "false");		
	         mailProps.put("mail.smtp.auth", "true");  
	        try {
	        	Authenticator auth = new Gmail();
	            Session ses = Session.getInstance(mailProps,auth);
	            ses.setDebug(true);
	            MimeMessage msg = new MimeMessage(ses);
	            msg.setSubject(subject);
	            Address fromAddr = new InternetAddress(mailId);
	            msg.setFrom(fromAddr);
	            Address toAddr = new InternetAddress(to);
	            msg.addRecipient(Message.RecipientType.TO, toAddr);
	            msg.setContent(content, "text/html; charset=UTF-8");
	            Transport.send(msg);
	            System.out.println("성공"); 
	            session.setAttribute("messageContent", m.getEmail()+"로 비밀번호 변경 링크를 보냈습니다. ");
		    	session.setAttribute("messageType", "완료메세지");
	                       
	            response.sendRedirect(request.getHeader("referer"));
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	    }else{
	    	session.setAttribute("messageContent", "입력한 계정은 없는 계정입니다.");
	    	session.setAttribute("messageType", "오류메세지");
            response.sendRedirect(request.getHeader("referer"));
	    }


	} //method 끝

	

	

	

	

}//class 끝