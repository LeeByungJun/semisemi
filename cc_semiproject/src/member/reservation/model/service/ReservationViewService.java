package member.reservation.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;

import member.reservation.model.dao.ReservationViewDao;
import member.reservation.model.vo.ReservationView;

public class ReservationViewService {

	public ReservationViewService() {}
	
	public ReservationView selectReservation(int mem_num) {
		// TODO Auto-generated method stub
		Connection conn = getConnection();
		ReservationView rv = new ReservationViewDao().selectReservation(conn, mem_num);
		close(conn);
		return rv;
	}
}
