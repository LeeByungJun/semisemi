package reportcomment.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import reportcomment.model.service.ReportCommentService;
import reportcomment.model.vo.ReportComment;

/**
 * Servlet implementation class PlusCommentServlet
 */
@WebServlet("/pluscomment")
public class PlusCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlusCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		int reportNo = Integer.parseInt(request.getParameter("reportNo"));
		String addcomments = request.getParameter("addcomments");
		
		//System.out.println("전송값 출력 : "+username+", "+reportNo+", "+addcomments);
		
	
		ReportCommentService rcs = new ReportCommentService();
		ReportComment rc = new ReportComment(reportNo, username, addcomments);
		
		int result = rcs.insertComment(rc);
		
		RequestDispatcher view = null;
		if(result>0) { //댓글등록이 DB에 잘 되었을시 
			/*PrintWriter out = response.getWriter();
			out.append(username);
			out.append(addcomments);*/
			
			//JSONObject responseType = new JSONObject();
			//JSONArray arr = new JSONArray();			
			JSONObject jj = new JSONObject();
				jj.put("commentno", rc.getReportcommentno());
				jj.put("reportcurrentno", rc.getReportno());
				jj.put("useremail", rc.getUserEmail());
				jj.put("replycontents", rc.getReportcommentcontents());
				//responseType.put("response", jj);	
			
			System.out.println("json : "+jj.toJSONString());
			//여기까지 출력성공 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
				
		    response.setContentType("application/json; charset=utf-8");			
			PrintWriter out = response.getWriter();
			out.print(jj.toJSONString());
			out.flush();
			out.close();
			
		    
		}else {
			view = request.getRequestDispatcher("/cs/WookJae/views/report/reportError.jsp");
			request.setAttribute("error", "댓글등록 실패!..");
			view.forward(request, response);
		}
		
		
		
	}

}
