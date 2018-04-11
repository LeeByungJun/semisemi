package admin.reservation.model.service;

import java.util.ArrayList;

import admin.reservation.model.dao.AdminReservationDao;
import admin.reservation.model.vo.ReservationList;

import java.sql.*;
import static common.JDBCTemplate.*;

public class AdminReservationService {
	
	public AdminReservationService() {
		
	}

	public ArrayList<ReservationList> selectReservationList() {
		//예약 리스트 전체조회용 메소드
		Connection conn = getConnection();
		ArrayList<ReservationList> list = new AdminReservationDao().selectReservationList(conn);
		close(conn);
		return list;
	}

}
