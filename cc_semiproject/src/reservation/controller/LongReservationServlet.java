package reservation.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import reservation.model.service.ReservationService;
import reservation.model.vo.CarInsurance;
import reservation.model.vo.CarType;
import reservation.model.vo.ReservationList;

/**
 * Servlet implementation class LongReservationServlet
 */
@WebServlet("/l_reservation")
public class LongReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LongReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
request.setCharacterEncoding("utf-8");
		
		CarType ct=new CarType();
		CarInsurance ci=new CarInsurance();		
		ReservationList rlist=new ReservationList();
		
		
		
		rlist.setMem_Num(Integer.parseInt(request.getParameter("mem_num")));
		rlist.setG_Code(request.getParameter("m_code"));
		rlist.setCarStarDate(Date.valueOf(request.getParameter("n_s_date")));
		rlist.setCarEndDate(Date.valueOf(request.getParameter("n_e_date")));
		rlist.setCarNote(request.getParameter("carnote"));
		
		ct.setCarName(request.getParameter("c_type"));
		ci.setCarInsurnace_Name(request.getParameter("n_insurance"));
		
		int result=new ReservationService().insertShortReservation(rlist,ct,ci);
		
		
		
		if(result>0) {
			response.sendRedirect("index.jsp");
		}else {
			//뷰 파일 저정시 절대 경로 사용 못 하는 메소드임
			//상대경로만 사용 가능함
			RequestDispatcher view= request.getRequestDispatcher("/cs/HanJin/insuranceReservation.jsp");
			request.setAttribute("message", "단기 예약 실패!");
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
