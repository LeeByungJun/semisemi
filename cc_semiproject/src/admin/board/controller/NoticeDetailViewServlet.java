package admin.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailViewServlet
 */
@WebServlet("/nview")
public class NoticeDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 자세한 뷰 보여주기위한 서블릿
		System.out.println("notice servlet : " + request.getParameter("no"));
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		Notice n = new NoticeService().selectNotice(no);
		
		if(n != null) {
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/noticeDetailView.jsp");
			request.setAttribute("notice", n);
			view.forward(request, response);
		}else {
			System.out.println("관리자 공지사항 상세보기 에러");
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
