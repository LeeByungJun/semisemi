package member.reservation.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import member.reservation.model.vo.ReservationView;

public class ReservationViewDao {
	public ReservationViewDao() {}
	
	public ReservationView selectReservation(Connection con, int mem_num) {

		ReservationView rv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT RL.RESERVATIONNUMBER, RL.CARSTARTDATE, RL.CARENDDATE, "
				+ "RL.CARBRANCH, CT.CARNAME , CT.CARPRICE, CI.CARINSURANCE_NAME "
				+ "FROM RESERVATIONLIST RL, CARTYPE CT, CARINSURANCE CI "
				+ "WHERE RL.CAR_SERIAL_NUMBER = CT.CAR_SERIAL_NUMBER "
				+ "AND RL.CARINSURANCE_NO = CI.CARINSURANCE_NO AND RL.MEM_NUM = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mem_num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				rv = new ReservationView();
				
				rv.setMem_num(mem_num);
				rv.setReser_no(rset.getInt(1));
				rv.setReser_startday(rset.getDate(2));
				rv.setReser_endday(rset.getDate(3));
				rv.setReser_office(rset.getString(4));
				rv.setReser_car(rset.getString(5));
				rv.setReser_cash(rset.getInt(6));
				//rv.setReser_pay(rset.getString("reser_pay"));
				rv.setReser_insurance(rset.getString(7));
				
				System.out.println("rvdao rv.toString = " + rv.toString());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rv;
	}
}
