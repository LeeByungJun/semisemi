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
 * Servlet implementation class AddCommentServlet
 */
@WebServlet("/addcom")
public class AddCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String writeUser = request.getParameter("username");
		String commentContents = request.getParameter("addcomments");
		int recommentNo = Integer.parseInt(request.getParameter("reportNo"));
		
		//System.out.println("뷰어에서 전달된 댓글자료 : "+writeUser+" / 뷰어에서 전달된 댓글내용 : "+commentContents);
	
		ReportComment rc = new ReportComment();
		rc.setUserEmail(writeUser);
		rc.setReportcommentcontents(commentContents);
		rc.setReportno(recommentNo);		
		
		int result = new ReportCommentService().addComment(rc);
		RequestDispatcher view = null;
		response.setContentType("text/html charset=utf-8"); 
		if(result>0) {
			response.sendRedirect("/cs/rlist?page=1");			
		}else {
			view=request.getRequestDispatcher("Wook/Jae/Views/report/ReportError.jsp");
			request.setAttribute("error", "신규 댓글등록실패..");
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
