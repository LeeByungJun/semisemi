package admin.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeInsertViewServlet
 */
@WebServlet("/noticeinsertservlet")
public class NoticeInsertViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 게시글 입력용 서블릿
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		
		Notice n = new Notice();
		n.setN_title(title);
		n.setN_writer(writer);
		n.setN_contents(contents);
		
		int result = new NoticeService().insertNotice(n);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("게시글 입력 성공!");
		}else {
			out.print("게시글 입력 실패");
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
