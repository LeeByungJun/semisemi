package mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static function.EncryptPassword.*;

/**
 * Servlet implementation class mailSender
 */
@WebServlet("/msender")
public class mailSender extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public mailSender() {
		super();
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이메일
		request.setCharacterEncoding("utf-8");
		String to_email = request.getParameter("email");//to_email
		System.out.println("to_email = " + to_email);
		
		String username = null;
		String contents = null;
		
		Properties p = new Properties();
		p.put("mail.smtp.user", "pjlee9212@gmail.com");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465"); // 호스트
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		Authenticator auth = new SMTPAuthenticator("pjlee9212", "Asdf1020?");

		Session session = Session.getInstance(p, auth);

		session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.

		MimeMessage msg = new MimeMessage(session);
		
		if(request.getParameter("username") != null && request.getParameter("contents") != null) {
			username = request.getParameter("username");
			contents = request.getParameter("contents");
			
			System.out.println(username + ", " + contents + ", " + to_email);
			
			try {
				msg.setSubject(username + "님 문의사항", "UTF-8");
				Address fromAddr = new InternetAddress(to_email); // 보내는 사람의 메일주소

				msg.setFrom(fromAddr);

				InternetAddress addressTo = new InternetAddress("pjlee9212@gmail.com");

				msg.setRecipient(Message.RecipientType.TO, addressTo);

				msg.setContent("문의사항 : " + contents, "text/html;charset=utf-8");

				Transport.send(msg);
				
				
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			//response.sendRedirect("byungjun/views/questionEnd.jsp");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append("문의사항 발송 성공!");
			
		}else {
			StringBuffer sb = new StringBuffer(); //인증번호 생성용 스버

			try {
				msg.setSubject("이메일 인증", "UTF-8");
				Address fromAddr = new InternetAddress("pjlee9212@gmail.com"); // 보내는 사람의 메일주소

				msg.setFrom(fromAddr);

				InternetAddress addressTo = new InternetAddress(to_email);

				msg.setRecipient(Message.RecipientType.TO, addressTo);
				
				//이메일 인증 번호는 난수로 해결!
				for(int i=0;i<=6;i++) {
					int n = (int)(Math.random() * 10);
					sb.append(n);
				}

				msg.setContent("인증번호 : " + sb, "text/html;charset=utf-8");

				Transport.send(msg);
				
				
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append(sb);
			
			/*response.setContentType("text/html; charset=utf-8");
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/childEmail.jsp"); //view를 정하자
			request.setAttribute("num", sb);
			view.forward(request, response);
			이거죽여도됨 테ㅡ트용 아 ㅇㅋ
			response.sendRedirect("byungjun/views/childEmail.jsp?num=" + sb);*/
			/*HttpSession session1 = request.getSession();
			session1.setAttribute("num", sb);
			response.sendRedirect("byungjun/views/childEmail.jsp");*/
		}
		
	}

	private static class SMTPAuthenticator extends javax.mail.Authenticator {

		String id;

		String pwd;

		SMTPAuthenticator(String id, String pwd) {

			this.id = id;

			this.pwd = pwd;

		}

		public PasswordAuthentication getPasswordAuthentication() {

			return new PasswordAuthentication(id, pwd); // 구글아이디는 구글계정에서 @이후를 제외한 값이다. (예: abcd@gmail.com --> abcd)

		}

	}
}
