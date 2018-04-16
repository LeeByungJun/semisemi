package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import reservation.model.service.ReservationService;
import reservation.model.vo.CarInsurance;
import reservation.model.vo.CarType;
import reservation.model.vo.NoMemberReservation;
import visit.model.vo.Visit;

/**
 * Servlet implementation class NoMemberReservationAjax
 */
@WebServlet("/n_m_reservation_a")
public class NoMemberReservationAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMemberReservationAjax() {
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
		
		
		NoMemberReservation nmreservation = new NoMemberReservation();
		CarType ct=new CarType();
		CarInsurance ci=new CarInsurance();
		
		System.out.println("Servlet 받는값 시작----------");
		System.out.println(request.getParameter("n_name"));
		System.out.println(request.getParameter("n_number"));
		System.out.println(request.getParameter("n_gander"));
		System.out.println(request.getParameter("n_age"));
		System.out.println(request.getParameter("n_email"));
		System.out.println(request.getParameter("n_tel"));
		
		System.out.println("날짜 계산 ..."+(request.getParameter("n_s_date")+request.getParameter("n_e_date")));
		System.out.println(request.getParameter("n_e_date"));
		System.out.println(request.getParameter("c_type"));
		System.out.println(request.getParameter("c_type"));
		System.out.println(request.getParameter("n_note"));
		System.out.println("Servlet 받는값 끝----------");
		
		
		
		nmreservation.setNoMemberName(request.getParameter("n_name"));
		nmreservation.setNoMemberNumber(request.getParameter("n_number"));
		nmreservation.setNoMemberGender(request.getParameter("n_gander"));
		nmreservation.setNoMemberAge(Integer.parseInt(request.getParameter("n_age")));
		nmreservation.setNoMemberEmail(request.getParameter("n_email"));
		nmreservation.setNoMemberTell(request.getParameter("n_tel"));
		nmreservation.setCarStartDate(Date.valueOf(request.getParameter("n_s_date")));
		nmreservation.setCarEndDate(Date.valueOf(request.getParameter("n_e_date")));
		ct.setCarName(request.getParameter("c_type"));
		ci.setCarInsurnace_Name(request.getParameter("n_insurance"));
		//
		//nmreservation.setCarInsurance_No(Integer.parseInt(request.getParameter("carinsurance_no_2")));
		nmreservation.setCarNote(request.getParameter("n_note"));
		
		
		int result= new ReservationService().insertNoMemberReservation(nmreservation,ct,ci);
		
		
		if(result>0) {
			//투데이 예약 카운트 증가
			new ReservationService().countReservation();
			
			
			int price=new ReservationService().priceNoReservation();
			
			System.out.println("servlet 가격:"+price);
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(price);//보내기
			out.flush();
			out.close();
			response.sendRedirect("index.jsp");
			
			
		}else {
			//뷰 파일 저정시 절대 경로 사용 못 하는 메소드임
			//상대경로만 사용 가능함
			RequestDispatcher view= request.getRequestDispatcher("/cs/HanJin/insuranceReservation.jsp");
			request.setAttribute("message", "비회원 예약 실패!");
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
