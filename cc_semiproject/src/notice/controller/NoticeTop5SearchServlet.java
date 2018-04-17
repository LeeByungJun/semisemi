package notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeTop5SearchServlet
 */
@WebServlet("/notop5")
public class NoticeTop5SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeTop5SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> list = new NoticeService().noticeTop5();
	            
	      //2.제이슨방식
	      JSONObject noticeType = new JSONObject();
	      //JSONObject는 값을 담을 수 있을 뿐만아니라 JSONArray도 담을 수 있다.

	      JSONArray arr = new JSONArray();

	      for(Notice n : list){
	         JSONObject j = new JSONObject();
	         //parse 에러는 요부분에러에요 하나하나 주석처리해가면서 확인해보시면될것같아요
	         //해보시고 안되면 톡주세용 ㅇㅋ
	         j.put("n_no", n.getN_no());
	         j.put("n_title", n.getN_title());
	         j.put("n_writer", n.getN_writer());
	         j.put("n_contents", n.getN_contents());
	         j.put("n_sysdate", n.getN_sysdate().toString());
	         j.put("readcount", n.getReadCount());
	         arr.add(j);
	      };
	      noticeType.put("list", arr);

	      response.setContentType("application/json; charset=utf-8");
	      PrintWriter out = response.getWriter();
	      out.print(noticeType.toJSONString());
	      out.flush();
	      out.close();      

	      /*ArrayList<Notice> list = new NoticeService().noticeTop5();
	            
	      response.setContentType("text/html; charset=utf-8");
	      RequestDispatcher view = null;
	      if(list.size()>0) {
	         view = request.getRequestDispatcher("index.jsp");
	         request.setAttribute("list", list);
	         view.forward(request, response);         
	      }else {
	         System.out.println("인덱스 top5 공지사항 조회 실패");
	      }*/

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
