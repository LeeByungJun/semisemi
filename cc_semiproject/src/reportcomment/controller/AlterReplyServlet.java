package reportcomment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AlterReplyServlet
 */
@WebServlet("/abctest")
public class AlterReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlterReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("useremail");
		int writeNo = Integer.parseInt(request.getParameter("writeNo"));
		String replyNo = request.getParameter("replyNo");
		
		/*String str1 = replyNo.substring(1, 3); //댓글번호 추출
		String str2 = replyNo.substring(5);*/
		String replyContents = request.getParameter("replyContents");
		
		System.out.println("전송값 콘솔출력");
		System.out.println(userEmail+", "+writeNo+", "+replyNo);
		
		
		
		
		
		System.out.println("유저가 수정하려고 입력한 내용 > "+replyContents);
		
		
	}

}
