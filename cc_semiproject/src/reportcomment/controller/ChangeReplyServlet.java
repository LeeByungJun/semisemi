package reportcomment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import reportcomment.model.service.ReportCommentService;
import reportcomment.model.vo.ReportComment;

/**
 * Servlet implementation class ChangeReplyServlet
 */
@WebServlet("/replychange")
public class ChangeReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));		
		String changeinput = request.getParameter("changeinput");
		//int changeinputNo = Integer.parseInt(request.getParameter("changeinputno"));
		
		System.out.println("수정을 시도하는 댓글작성인 : "+username);
		System.out.println("수정을 시도하는 게시판 고유 번호 : "+reportNo);
		System.out.println("유저가 수정한 내용 : "+changeinput);
		/*System.out.println("유저가 수정한 댓글번호 : "+changeinputNo);
		
		ReportComment rc = new ReportComment(changeinputNo, reportNo, username, changeinput);
		
		int result = new ReportCommentService().renewCommnet(rc);
		
		
		RequestDispatcher view = null;
		if(result>0) {
			JSONObject json = new JSONObject();
			
			
			
		}else {
			view = request.getRequestDispatcher("/cs/WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "댓글 수정에 실패하였습니다.");
			view.forward(request, response);
			
		}*/
			
		
		
		
	}
}
















