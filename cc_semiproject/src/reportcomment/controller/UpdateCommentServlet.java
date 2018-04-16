package reportcomment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reportcomment.model.service.ReportCommentService;
import reportcomment.model.vo.ReportComment;

/**
 * Servlet implementation class UpdateCommentServlet
 */
@WebServlet("/altercom")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String rc = request.getParameter("reportCommentNo");
		String rc2 = rc.substring(1);
		
		int checkReplyNo = Integer.parseInt(rc2);
		//System.out.println("수정을 시도하는 댓글번호 : "+checkReplyNo);
		ReportComment rec = new ReportCommentService().checkReply(checkReplyNo);
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		
		if(rec!=null) { //수정을하기위해 조회한 댓글객체가 존재한다면 아래페이지로 수정페이지이동
			view=request.getRequestDispatcher("WookJae/views/report/reportcommentalter.jsp");
			request.setAttribute("reportcommentobject", rec);
			request.setAttribute("checkReplyNo", checkReplyNo);
			view.forward(request, response);
		}else {
			view=request.getRequestDispatcher("WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "수정시도한 댓글조회가 실패되었습니다.");
			view.forward(request, response);
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
