package admin.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteViewServlet
 */
@WebServlet("/noticedeleteserlvet")
public class NoticeDeleteViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자 게시글 삭제용 서블릿
		int no = Integer.parseInt(request.getParameter("no"));
		
		int result = new NoticeService().deleteNotice(no);
		
		response.setContentType("text/html; charset=utf-8");
		if(result > 0) {
			System.out.println("관리자 게시글 삭제 성공!");
			response.sendRedirect("boardmanage?page=1");
		}else {
			System.out.println("관리자 게시글 삭제 실패!");
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
