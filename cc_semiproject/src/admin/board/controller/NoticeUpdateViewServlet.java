package admin.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateViewServlet
 */
@WebServlet("/noticeupdateservlet")
public class NoticeUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//notice 업데이트 서블릿
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		Date sysdate1 = Date.valueOf(request.getParameter("sysdate1"));
		String contents = request.getParameter("contents");
		
		Notice n = new Notice();
		n.setN_no(no);
		n.setN_title(title);
		n.setN_writer(writer);
		n.setN_sysdate(sysdate1);
		n.setN_contents(contents);
		
		int result = new NoticeService().updateNotice(n);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print("게시글 수정 성공");
		}else {
			out.print("게시글 수정 실패");
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
