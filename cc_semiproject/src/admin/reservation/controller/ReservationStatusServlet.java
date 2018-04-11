package admin.reservation.controller;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.reservation.model.service.AdminReservationService;
import admin.reservation.model.vo.ReservationList;

/**
 * Servlet implementation class ReservationStatusServlet
 */
@WebServlet("/reserstatus")
public class ReservationStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//등급 별로 예약현황 뽑아오는 데 사용하는 서블릿
		ArrayList<ReservationList> list = new AdminReservationService().selectReservationList();
		
		response.setContentType("text/html; charset=utf-8");
		if(list.size() > 0) {
			RequestDispatcher view = request.getRequestDispatcher("byungjun/views/reserStatus.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);
		}else {
			System.out.println("관리자 예약리스트 조회 실패");
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
