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
 * Servlet implementation class UpdateRealCommentServlet
 */
@WebServlet("/altercom2")
public class UpdateRealCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRealCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");		
		
		String useremail = request.getParameter("email");
		int reportNo = Integer.parseInt(request.getParameter("reportno"));
		int reportCommentNo = Integer.parseInt(request.getParameter("reportcommentno"));
		
		
		//System.out.println("수정을 시도하는 로그인유저(이메일) : "+useremail);
		//System.out.println("수정을 시도하는 게시글 번호 : "+reportNo);
		//System.out.println("수정을 시도하는 댓글번호2 : "+reportCommentNo);
		
		String reportcontents = request.getParameter("contents");
		
		System.out.println("새로수정한 댓글 내용은 -> "+reportcontents);
		
		ReportComment rec = new ReportComment(reportCommentNo, reportNo, useremail, reportcontents);
		//새로운 New ReportComment객체를 생성하여 전달받은 값을 담는다.
		
		int result = new ReportCommentService().realUpdateCommit(rec);
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;

		if(result>0) {
			response.sendRedirect("/cs/rdetail?page=1&no="+reportNo);
		}else {
			view = request.getRequestDispatcher("/cs/WookJae/views/report/reportError.jsp");
			request.setAttribute("errer", "선택하신 댓글수정 실패하였습니다.");
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
