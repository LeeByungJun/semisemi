package notice.controller;

/*import java.io.IOException;
import java.util.List;*/

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/*List<Notice> noticeList = new NoticeService().selectList();
		
		response.setContextType("text/html; charset=utf-8");
		RequestDispatcher view = null;
		if(noticeList.size()>0) {
			view = request.getRequestDispatcher("WookJae/views/notice.jsp");
			request.setAttribute("noticeList",noticeList);
			view.foward(request,response);	
		}else {
			view = request.getRequestDispatcher("WookJae/views/noticeError.jsp");
			request.setAttribute("message","조회된 공지 정보가 없습니다..");
			view.foward(request,response);
		}*/

		//List<Notice> noticeList = new NoticeService().selectList();

		//response.setContentType("text/html; charset=utf-8");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
