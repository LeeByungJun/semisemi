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
 * Servlet implementation class DeleteCommentServlet
 */
@WebServlet("/deletereply")
public class DeleteCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		
		String userName = request.getParameter("username");
		//System.out.println("삭제하려는 댓글작성자 : "+userName);
		
		String rc = request.getParameter("reportCommentNo");
		String rc2 = rc.substring(1);
		
		int reportCommentNo = Integer.parseInt(rc2);
		//System.out.println("삭제시도하려는 원글번호 : "+reportCommentNo);
		
		int currentPage = Integer.parseInt(request.getParameter("currentReport"));
		//System.out.println("현재 삭제를 시도하는 게시글의 번호 : "+currentPage);
		
		int pagepage = Integer.parseInt(request.getParameter("rpage"));
		//System.out.println("현재 삭제를 시도하는 페이지의번호 : "+pagepage);
		
		
		int result = new ReportCommentService().deleteComment(reportCommentNo);
		
		response.setContentType("text/html; charset=utf-8");
		
		RequestDispatcher view = null;
		if(result>0) {
			//response.sendRedirect("/cs/rlist?page=1");
			//response.sendRedirect("/cs/rdetail?page=1&no="+reportNo);
			response.sendRedirect("/cs/rdetail?page="+pagepage+"&no="+currentPage);
		}else {
			view = request.getRequestDispatcher("Wook/Jae/Views/report/ReportError.jsp");
			request.setAttribute("error", "error..");
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
