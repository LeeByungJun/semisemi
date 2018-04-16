package member.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.reservation.model.service.ReservationViewService;
import member.reservation.model.vo.ReservationView;

/**
 * Servlet implementation class ReservationViewServlet
 */
@WebServlet("/reserview")
public class ReservationViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//String mem_num = request.getParameter("mem_num");
		int mem_num = Integer.parseInt(request.getParameter("num"));
		
		//ReservationView rsview = new ReservationViewService().selectReservation(mem_num);
		ArrayList<ReservationView> rsview= new ReservationViewService().selectList(mem_num);
		RequestDispatcher view = null;
		
		if (rsview != null) {
			view = request.getRequestDispatcher("YunHee/views/reservation.jsp");
			request.setAttribute("rsview", rsview);
			view.forward(request, response);
		}else {
			System.out.println("조회된 데이터 없음");
			view = request.getRequestDispatcher("YunHee/views/reservation.jsp");
			request.setAttribute("rsview", rsview);
			view.forward(request, response);
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
