package mvc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

//import net.sf.json.JSONObject;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/mail")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String from_email = request.getParameter("from_email");
        String to_email = request.getParameter("to_email");
        String mail_subtitle = request.getParameter("subtitle");
        String mail_content = request.getParameter("content");     

        System.out.println("from_email = " + from_email);
        System.out.println("to_email = " + to_email);         

         

        // 먼저 환경 정보를 설정해야 한다.
        // 메일 서버 주소를 IP 또는 도메인 명으로 지정한다.
        Properties props = System.getProperties();
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.quitwait", "false");
        
        
        Authenticator auth = new MyAuthenticator();
        // 위 환경 정보로 "메일 세션"을 만들고 빈 메시지를 만든다
        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(true);        

        MimeMessage msg = new MimeMessage(session);         

        try {
            // 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
            msg.setFrom(new InternetAddress(from_email, "*보내는사람*"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email, "*받는사람*"));
            /*
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress("eee@fff.co.kr", "선덕여왕"));
            msg.addRecipient(Message.RecipientType.CC, new InternetAddress("ggg@hhh.co.kr", "의자왕"));
            */
            msg.setSubject(mail_subtitle);
            msg.setContent(mail_content, "text/html; charset=utf-8");

            // 메일을 발신한다
            Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
         
        response.setContentType("text/x-json;charset=UTF-8");            
        response.setHeader("Cache-Control", "no-cache");         

        PrintWriter out = response.getWriter();        

        /*JSONObject json = new JSONObject();

        json.put("result", "true");

        out.println(json);*/


	}
	
	static class MyAuthenticator extends Authenticator {

        public PasswordAuthentication getPasswordAuthentication() {

            //String username = "******@gmail.com";

            //String password = "*****";

            return null/*new PasswordAuthentication(username, password)*/;

        }

    }


}
