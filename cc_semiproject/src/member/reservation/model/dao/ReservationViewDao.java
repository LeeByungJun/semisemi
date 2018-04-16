package member.reservation.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import member.reservation.model.vo.ReservationView;

public class ReservationViewDao {
	public ReservationViewDao() {}
	
	public ArrayList<ReservationView> selectList(Connection con, int mem_num) {
		ArrayList<ReservationView> list = new ArrayList<ReservationView>();
		
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
			
			while(rset.next()) {
				rv = new ReservationView();
				
				rv.setMem_num(mem_num);
				rv.setReser_no(rset.getInt("RESERVATIONNUMBER"));
				rv.setReser_startday(rset.getDate("CARSTARTDATE"));
				rv.setReser_endday(rset.getDate("CARENDDATE"));
				rv.setReser_office(rset.getString("CARBRANCH"));
				rv.setReser_car(rset.getString("CARNAME"));
				rv.setReser_cash(rset.getInt("CARPRICE"));
				rv.setReser_insurance(rset.getString("CARINSURANCE_NAME"));

				list.add(rv);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
