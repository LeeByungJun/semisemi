package reservation.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;


import reservation.model.dao.ReservationDao;
import reservation.model.vo.CarInsurance;
import reservation.model.vo.CarType;
import reservation.model.vo.NoMemberReservation;
import reservation.model.vo.ReservationList;
import visit.model.vo.Visit;

public class ReservationService {

	public int insertNoMemberReservation(NoMemberReservation nmreservation, CarType ct, CarInsurance ci) {
		Connection con=getConnection();
		int result=new ReservationDao().insertNoMeberReservation(con,nmreservation,ct,ci);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		return result;
	}

	public ArrayList<CarType> carTypeList(int num) {
		Connection con= getConnection();
		ArrayList<CarType> list=new ReservationDao().carTypeList(con, num);
		close(con);
		return list;
	}

	public ArrayList<CarInsurance> insuranceList() {
		Connection con=getConnection();
		ArrayList<CarInsurance> list=new ReservationDao().insuranceList(con);
	
		close(con);
		return list;
		}

	public int insertShortReservation(ReservationList rlist, CarType ct, CarInsurance ci) {
		Connection con=getConnection();
		int result=new ReservationDao().insertShortReservation(con,rlist,ct,ci);
		
		if(result>0)
			commit(con);
		else
			rollback(con);
		return result;
	}

	public int priceNoReservation() {
		Connection con=getConnection();
		
		int price=new ReservationDao().priceNoReservation(con);
		
		if(price>0)
			commit(con);
		else
			rollback(con);
		return price;
	}

	public int priceMemberReservation() {
		Connection con=getConnection();
		
		int price =new ReservationDao().priceMembeRservation(con);
		if(price>0)
			commit(con);
		else
			rollback(con);
		return price;
	}

	public void countReservation() {
		Connection conn = getConnection();
		int result = new ReservationDao().countReservation(conn);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
	}

	public ArrayList<Visit> totalReservation() {
		Connection conn = getConnection();
		ArrayList<Visit> list = new ReservationDao().totalReservation(conn);
		close(conn);
		return list;
	}

}
