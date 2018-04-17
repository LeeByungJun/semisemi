package notice.controller;

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
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdateready")
public class NoticeUpdateReadyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateReadyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 수정페이지 출력 처리용 컨트롤러
		int no = Integer.parseInt(request.getParameter("no"));
		//System.out.println("선택한 공지글의 번호 : "+no);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		//System.out.println("선택된 페이지 : "+currentPage);
		
		Notice notice = new NoticeService().selectNotice(no);
		//해당게시판의 번호를 selectNotice()의 인자값으로 전달하여 해당되는 게시판의 객체를 리턴받음

		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		
		if(notice!=null) { //request요청 받은것 response응답할 것
			view = request.getRequestDispatcher("WookJae/views/notice/noticeUpdateView.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("page", new Integer(currentPage));
			view.forward(request, response);
		}else{
			view=request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", "해당수정글 조회실패하여 공지수정실패..");
			view.forward(request, response);
		}
	}
	
	/*view=request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
	request.setAttribute("error", "공지글 수정 페이지로 이동 요청 실패");
	view.forward(request, response);*/

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
