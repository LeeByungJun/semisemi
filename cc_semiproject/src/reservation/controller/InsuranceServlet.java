package reservation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import reservation.model.service.ReservationService;
import reservation.model.vo.CarInsurance;

/**
 * Servlet implementation class InsuranceServlet
 */
@WebServlet("/inselect")
public class InsuranceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsuranceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		ArrayList<CarInsurance> list= new ReservationService().insuranceList();
		
		
		System.out.println("보험 서블릿 리스트"+list);
		
		JSONObject insuranceName=new JSONObject();
		
		JSONArray arr = new JSONArray();
		
		
		for(CarInsurance ci :list) {
				JSONObject jj=new JSONObject();
			jj.put("carinsurance_name", URLEncoder.encode(ci.getCarInsurnace_Name(),"utf-8"));
			jj.put("carinsurance_price",ci.getCarInsurance_Price());
			arr.add(jj);
			
		};
		
		insuranceName.put("list",arr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(insuranceName.toJSONString());
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
