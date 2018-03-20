package mvc.servlet;

import java.io.IOException;
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
		// TODO Auto-generated constructor stub
		// naver일 경우 smtp.naver.com
		// google일 경우 smtp.gmail.com
		/*
		 * String host = "smtp.naver.com";
		 * 
		 * final String username = "pjlee92"; //네이버 아이디 입력 final String password =
		 * "3apdlvmf3!"; //네이버 비밀번호 입력 int port = 465;
		 * 
		 * //메일 내용 String recipient = "semicolon92@naver.com"; //받는 사람의 메일 주소를 입력하세요.
		 * String subject = "이메일 인증"; //메일 제목 String body = "1234"; //메일 내용
		 * 
		 * Properties props = System.getProperties(); //정보를 담기위한 객체 생성
		 * 
		 * //SMTP 서버 정보 설정 props.put("mail.smtp.host", host);
		 * props.put("mail.smtp.port", port); props.put("mail.smtp.auth", "true");
		 * props.put("mail.smtp.ssl.enable", "true"); props.put("mail.smtp.ssl.trust",
		 * host);
		 * 
		 * //Session 생성 Session session = Session.getDefaultInstance(props,new
		 * javax.mail.Authenticator() { String un = username; String pw = password;
		 * protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
		 * return new javax.mail.PasswordAuthentication(un,pw); } });
		 * session.setDebug(true); //for debug
		 * 
		 * Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 try {
		 * mimeMessage.setFrom(new InternetAddress("pjlee92@naver.com")); //발신자 세팅, 보내는
		 * 사람의 이메일 주소 한번더 입력 mimeMessage.setRecipient(Message.RecipientType.TO, new
		 * InternetAddress(recipient)); //수신자 셋팅. .to외에 .cc(참조), .bcc(숨은참조)도 있음
		 * mimeMessage.setSubject(subject); //제목셋팅 mimeMessage.setText(body); //내용셋팅
		 * Transport.send(mimeMessage); //javax.mail.Transport.send()이용 } catch
		 * (AddressException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); } catch (MessagingException e) { // TODO Auto-generated
		 * catch block e.printStackTrace(); }
		 */
	}

	/*
	 * //naver일 경우 smtp.naver.com //google일 경우 smtp.gmail.com String host =
	 * "smtp.naver.com";
	 * 
	 * final String username = "pjlee92"; //네이버 아이디 입력 final String password =
	 * "3apdlvmf3!"; //네이버 비밀번호 입력 int port = 465;
	 * 
	 * //메일 내용 String recipient = "semicolon92@naver.com"; //받는 사람의 메일 주소를 입력하세요.
	 * String subject = "이메일 인증"; //메일 제목 String body = "1234"; //메일 내용
	 * 
	 * Properties props = System.getProperties(); //정보를 담기위한 객체 생성
	 * 
	 * //SMTP 서버 정보 설정 Properties props1 = System.getProperties();
	 */

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이메일
		request.setCharacterEncoding("utf-8");
		String to_email = request.getParameter("email");//to_email
		System.out.println(to_email);
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

		Authenticator auth = new SMTPAuthenticator("pjlee9212", "asdf1020!");

		Session session = Session.getInstance(p, auth);

		session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.

		MimeMessage msg = new MimeMessage(session);
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
		RequestDispatcher view = request.getRequestDispatcher("resources/include/login.jsp"); //view를 정하자
		request.setAttribute("num", sb);
		view.forward(request, response);

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
