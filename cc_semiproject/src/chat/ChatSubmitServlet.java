package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChatSubmitServlet
 */
@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서브밋 진입");
	request.setCharacterEncoding("UTF-8");
	
	String fromID = request.getParameter("fromID");
	String toID = request.getParameter("toID");
	String chatContent = request.getParameter("chatContent");
	
	response.setContentType("text/html; charset=UTF-8");
	if(fromID == null || fromID.equals("") || toID == null || toID.equals("") 
			|| chatContent == null || chatContent.equals("")) {
		response.getWriter().write("0");
	}else if(fromID.equals(toID)) {
		response.getWriter().write("-1");
	} else {
		fromID = URLDecoder.decode(fromID, "UTF-8");
		toID = URLDecoder.decode(toID, "UTF-8" );
		chatContent = URLDecoder.decode(chatContent, "UTF-8");
		
		
	   response.getWriter().write(new ChatDAO().submit(fromID, toID, chatContent) + "");
	   
	}
	}

}
