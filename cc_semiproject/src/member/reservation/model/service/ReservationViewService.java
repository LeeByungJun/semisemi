package member.reservation.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import member.reservation.model.dao.ReservationViewDao;
import member.reservation.model.vo.ReservationView;

public class ReservationViewService {

	public ReservationViewService() {}
	
	public ArrayList<ReservationView> selectList(int mem_num) {
		Connection con = getConnection();
		ArrayList<ReservationView> list = new ReservationViewDao().selectList(con, mem_num);
		close(con);
		return list;
	}
}
