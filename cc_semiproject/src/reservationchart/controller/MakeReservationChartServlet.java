package reservationchart.controller;

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

import reservation.model.service.ReservationService;
import visit.model.vo.Visit;

/**
 * Servlet implementation class MakeReservationChartServlet
 */
@WebServlet("/makechart")
public class MakeReservationChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeReservationChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전체 예약 카운트 그룹 별로 뽑아와서 세션에 담기
		ArrayList<Visit> totalReservationCount = new ReservationService().totalReservation();
		
		RequestDispatcher view = null;
		if(totalReservationCount.size() > 0) {
			System.out.println("make chart : 성공");
			view = request.getRequestDispatcher("index.jsp");
			request.setAttribute("totalReservationCount", totalReservationCount);
			view.forward(request, response);
			/*JSONObject json = new JSONObject();
			
			JSONArray jarr = new JSONArray();
			for(int i=0;i<totalReservationCount.size();i++) {
				JSONObject tmp = new JSONObject();
				tmp.put("visitdate", totalReservationCount.get(i).getVisitDate());
				tmp.put("visitcount", totalReservationCount.get(i).getVisitCount());
				
				jarr.add(tmp);
			}
			
			json.put("list", jarr);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();*/
		}else {
			System.out.println("메인페이지 차트 데이터 불러오기 실패...");
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
