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
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/ndetail")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지글 상세보기 처리용 컨트롤러 
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		/*System.out.println("선택 공지번호 출력");
		System.out.println(noticeNo);*/

		NoticeService nservice = new NoticeService();
		nservice.addReadCount(noticeNo);
		//글을 클릭시 조횟수 1증가처리 
		
		Notice notice = nservice.selectNotice(noticeNo);
		//글번호를 넘겨 해당 Notice객체를 리턴받음
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view = null;
		if(notice!=null) { /* 게시글의 조회가 된다면 */ 
			//view페이지로 이동할때 response.sendRedirect() 넘기는 데이터가 없이 바로 불러올때 
			//request.getRequestDispatcher() 넘기는 데이터의 값이 있을때 사용
			view = request.getRequestDispatcher("WookJae/views/notice/noticeDetailView.jsp");
			request.setAttribute("notice", notice);
			request.setAttribute("currentPage", new Integer(currentPage));
			view.forward(request, response);		
		}else if(notice==null) {
			view = request.getRequestDispatcher("WookJae/views/notice/noticeError.jsp");
			request.setAttribute("error", notice+"번 공지글 상세조회 실패..");
			view.forward(request, response);
			//"errormessage", noticeNo+"번 공지글 상세조회 실패.."
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
