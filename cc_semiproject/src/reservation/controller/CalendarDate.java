package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalendarDate
 */
@WebServlet("/calendar_c")
public class CalendarDate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalendarDate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String getToday =request.getParameter("getToday");
		String startdate =request.getParameter("startdate");
	
		System.out.println("현재 날짜 받아오는값"+getToday);
		System.out.println("시작 날짜 받아오는 값"+startdate);
		
		
		String getToday_1[] = getToday.split("-");
		String startdate_1[] = startdate.split("-");
		
		int t_day=Integer.parseInt((getToday_1[0]+getToday_1[1]+getToday_1[2]));
		
		int s_day=Integer.parseInt((startdate_1[0]+startdate_1[1]+startdate_1[2]));
	
		
		//System.out.println(t_day+s_day);
		boolean sum;
		
		if(t_day>s_day) {
			PrintWriter out=response.getWriter();
			sum=false;
		}else {
			
			sum=true;
		}
		
		System.out.println(sum);
		response.setContentType("application/json; charset=utf-8");	      
		PrintWriter out=response.getWriter();
		out.print(sum);//보내기
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
