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

/*import jdk.nashorn.internal.runtime.JSONListAdapter;*/
import reservation.model.service.ReservationService;
import reservation.model.vo.CarType;



/**
 * Servlet implementation class CarCategory
 */
@WebServlet("/carcategory")
public class CarCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String no =request.getParameter("no");
		
		int num=Integer.parseInt(no);
		
		//System.out.println("값"+no);

		ArrayList<CarType> list=new ReservationService().carTypeList(num);
		
		//System.out.println(list);

		//System.out.println("servlet = "+list);
		
		JSONObject carType=new JSONObject();
	
		JSONArray arr=new JSONArray();
		
		for(CarType ct : list) {
			JSONObject jj=new JSONObject();
		jj.put("carname", URLEncoder.encode(ct.getCarName(),"utf-8"));
		jj.put("car_serial_number", ct.getCar_Serial_Number());
		
		jj.put("carprice",ct.getCarPrice());
		
		arr.add(jj);
		
		//System.out.println("json"+carType.toJSONString());
		};
		
		//System.out.println("carType"+carType);
		//System.out.println("arr"+arr);
		
		carType.put("list",arr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print(carType.toJSONString());//보내기
		out.flush();//세트
		out.close();//세트
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
