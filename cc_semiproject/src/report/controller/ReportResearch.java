package report.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import report.model.service.ReportService;
import report.model.vo.Report;

/**
 * Servlet implementation class ReportResearch
 */
@WebServlet("/research")
public class ReportResearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportResearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Report> list = null;
		String opsearch = request.getParameter("searchoption");
		String inputsearch = request.getParameter("search");
		//System.out.println("선택한 카테고리 => "+opsearch);
		//System.out.println("입력한 검색어 콘솔출력 => "+inputsearch);
		int listCount = 0;
		int maxPage = 1;
		int startPage = 1;
		int endPage = 1;
		int currentPage = 1;
		int limit = 7;
		
		RequestDispatcher view = null;
		response.setContentType("text/html; charset=utf-8");
		if(opsearch.equals("작성자(이메일)")) {
			list = new ReportService().searchByEmail(inputsearch,limit);
			listCount = new ReportService().getEmailListCount(inputsearch);
			if(listCount > 7) {
				//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
				maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
				//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
				startPage = (((int)((double)currentPage / limit + 0.9))- 1) * limit + 1;
				endPage = startPage + limit - 1;
				
				if(maxPage < endPage)		
					endPage = maxPage;
			}
			System.out.println("==이메일==");
			System.out.println("listCount = " + listCount);
			System.out.println("maxPage = " + maxPage);
			System.out.println("startPage = " + startPage);
			System.out.println("endPage = " + endPage);
			
			view = request.getRequestDispatcher("WookJae/views/report/reportList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);			
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
			//System.out.println("이메일로 검색한 리스트를 뽑아오기");
			
			/*for(int i=0;i<list.size();i++) {
				System.out.println("list의 값" + i + " : " + list.get(i).toString());
			}*/
			
			/*JSONObject reportType = new JSONObject();
			JSONArray arr = new JSONArray();
			
			for(Report rt : list) {
				JSONObject jj = new JSONObject();
				jj.put("r_no", rt.getR_no());
				jj.put("email", rt.getEmail());
				//jj.put("r_title", URLEncoder.encode(rt.getR_title(),"utf-8"));
				//jj.put("r_contents", URLEncoder.encode(rt.getR_contents(),"utf-8"));
				jj.put("r_title", rt.getR_title());
				jj.put("r_contents", rt.getR_contents());
				if(rt.getR_original_filename() != null) {
					jj.put("r_original_filename", URLEncoder.encode(rt.getR_original_filename(),"utf-8"));
				}
				if(rt.getR_rename_filename() != null) {
					jj.put("r_rename_filename", URLEncoder.encode(rt.getR_rename_filename(),"utf-8"));
				}
				jj.put("r_sysdate", rt.getR_sysdate().toString());
				jj.put("readcount", rt.getReadCount());
				
				System.out.println("jj.get() = " + jj.get("email") + ", " + jj.get("r_original_filename"));
				
				arr.add(jj);
			};
			
			reportType.put("list", arr);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out =response.getWriter();
			out.print(reportType.toJSONString());
			out.flush();
			out.close();*/	
			
		}else if(opsearch.equals("제목")) {
			
			list = new ReportService().searchByTitle(inputsearch,limit);
			listCount = new ReportService().getTitleListCount(inputsearch);
			if(listCount > 7) {
				//총 페이지수 계산 : 목록이 1개일 때 1페이지로 처리
				maxPage = (int)((double)listCount / limit + 0.9);
				//현재 페이지 그룹(10개페이지를 한그룹처리)에 보여줄 시작 페이지수
				//현재 페이지가 13페이지이면 그룹은 11 ~ 20페이지가 보여지게함
				startPage = (((int)((double)currentPage / limit + 0.9))- 1) * limit + 1;
				endPage = startPage + limit - 1;
				
				if(maxPage < endPage)		
					endPage = maxPage;
			}
			System.out.println("==제목==");
			System.out.println("listCount = " + listCount);
			System.out.println("maxPage = " + maxPage);
			System.out.println("startPage = " + startPage);
			System.out.println("endPage = " + endPage);
			
			view = request.getRequestDispatcher("WookJae/views/report/reportList.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);			
			request.setAttribute("listCount", listCount);
			view.forward(request, response);
			//System.out.println("제목으로 검색한 리스트를 뽑아오기");
			//System.out.println(list.toString());
			
			
			
			//최종 전송용 json객체
			/*JSONObject reportType = new JSONObject();
			//list를 옮겨담을 json배열객체 선언
			JSONArray arr = new JSONArray();
			
			for(Report rt : list) {
				JSONObject jj = new JSONObject();
				jj.put("r_no", rt.getR_no());
				jj.put("email", rt.getEmail());
				//jj.put("r_title", URLEncoder.encode(rt.getR_title(),"utf-8"));
				//jj.put("r_contents", URLEncoder.encode(rt.getR_contents(),"utf-8"));
				jj.put("r_title", rt.getR_title());
				jj.put("r_contents", rt.getR_contents());
				if(rt.getR_original_filename() != null) {
					jj.put("r_original_filename", URLEncoder.encode(rt.getR_original_filename(),"utf-8"));
				}
				if(rt.getR_rename_filename() != null) {
					jj.put("r_rename_filename", URLEncoder.encode(rt.getR_rename_filename(),"utf-8"));
				}
				jj.put("r_sysdate", rt.getR_sysdate().toString());
				jj.put("readcount", rt.getReadCount());
				
				//System.out.println("jj.get() = " + jj.get("email") + ", " + jj.get("r_original_filename"));
				//json객체를 배열에 저장함
				arr.add(jj);
			};
			
			//System.out.println("json : "+reportType.toJSONString());
			
			reportType.put("list", arr);
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(reportType.toJSONString());
			out.flush();
			out.close();*/
		}
	

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}
}

















